#define FUNNY_VIDEOS_FILE_NAME "config/discord_videos.json"

/proc/init_discord_videos()
	if (!fexists(FUNNY_VIDEOS_FILE_NAME))
		return null
	var/list/videos_json = json_decode(file2text(FUNNY_VIDEOS_FILE_NAME))
	if (!length(videos_json))
		return null

	var/list/contents = list()
	for (var/entry in videos_json)
		if (entry["content"])
			contents += entry["content"]

	return contents

/datum/controller/subsystem/ticker/declare_completion(was_forced)
	if(!CONFIG_GET(flag/roundend_embeds)) // SPLURT EDIT - Discord rounded embeds.
		return ..()

	generate_roundend_embed()

	. = ..()

/datum/controller/subsystem/ticker/generate_quote_of_the_round(embed = FALSE)
	if(!embed)
		return ..()

	var/list/data = list()

	data["map_text"] = "__A shift on [SSmapping.current_map.map_name] has ended.__"
	if(quote_of_the_round_text)
		data["quote_presentation"] = "-# [pick(strings("quote_of_the_round.json", "workers"))] [pick(strings("quote_of_the_round.json", "action"))] [pick(strings("quote_of_the_round.json", "message"))] that occured during said shift:"
		data["quote_text"] = "**\"[quote_of_the_round_text]\"**"
		data["quote_attribution"] = "*-[quote_of_the_round_attribution]*"
		to_chat(world, span_notice("A quote of the round was found, and should have been sent to discord."))
		log_runtime("A quote of the round was found, and should have been sent to discord.")
	else
		if(world.time <= quote_of_the_round_record_start)
			to_chat(world, span_notice("A quote of the round could not be found due to the round being too short."))
			data["quote_presentation"] = "-# A quote of the round could not be found. The round ended too early."
			log_runtime("A quote of the round could not be found. The round ended too early.")
		else
			to_chat(world, span_notice("A quote of the round could not be found. Perhaps the crew should be more memorable."))
			data["quote_presentation"] = "-# A quote of the round could not be found. Perhaps the crew should be more memorable."
			log_runtime("A quote of the round could not be found. Perhaps the filters are too strict?")

	return data

/datum/controller/subsystem/ticker/proc/generate_roundend_embed()
	var/list/quote_of_the_round_data = generate_quote_of_the_round(TRUE)
	var/news_report = send_news_report()

	var/first_death = ""
	if(findtext(news_report, "Санкционированные Nanotrasen псайкеры с гордостью подтверждают сообщения о том, что в эту смену никто не умер!"))
		first_death = "Санкционированные Nanotrasen псайкеры с гордостью подтверждают сообщения о том, что в эту смену никто не умер!"
		news_report = replacetext(news_report, first_death, "")
	else if(findtext(news_report, "Санкционированные Nanotrasen псайкеры засекли слабые следы человека, якобы умершего неподалеку от станции. Его имя было:"))
		var/start_pos = findtext(news_report, "Санкционированные Nanotrasen псайкеры засекли слабые следы человека, якобы умершего неподалеку от станции. Его имя было:")
		var/end_pos = findtext(news_report, "(Shift on", start_pos)
		first_death = copytext(news_report, start_pos, end_pos)
		news_report = replacetext(news_report, first_death, "")

	var/datum/tgs_chat_embed/structure/embed = new

	embed.url = null //Placeholder, apparently it does not support byond:// links.

	embed.colour = "#[CONFIG_GET(string/roundend_embed_color)]"

	// Author
	embed.author = new("Новости Белых Лун")
	embed.author.url = embed.url

	// Title
	embed.title = quote_of_the_round_data["map_text"]

	// Description
	embed.description = "Текущий раунд закончился. Пожалуйста, приготовьтесь к сменному репортажу Nanotrasen News Network!"
	if(length(trim(news_report)))
		embed.description += "\n\n```\n[news_report]\n```"

	// Fields
	embed.fields = list()
	if(length(first_death))
		embed.fields += new /datum/tgs_chat_embed/field(
			"Первая смерть:",
			"```\n[first_death]\n```"
		)
	embed.fields += new /datum/tgs_chat_embed/field(
		"Цитата раунда:",
		quote_of_the_round_data["quote_presentation"] + (quote_of_the_round_data["quote_text"] ? "\n\n[quote_of_the_round_data["quote_text"]]\n[quote_of_the_round_data["quote_attribution"]]" : "")
	)
	embed.fields += new /datum/tgs_chat_embed/field(
		"Next round map",
		"```\n[SSmap_vote.next_map_config.map_name]\n```"
	)

	// Embed Image
	var/image_url = CONFIG_GET(string/roundend_image_url)
	if(CONFIG_GET(string/roundend_splashscreen_url) && CONFIG_GET(string/splashscreen_webserver_path))
		image_url = "[CONFIG_GET(string/roundend_splashscreen_url)][SStitle.splashscreen_name]"
	if(image_url && length(image_url))
		embed.image = new(image_url)

	// Thumbnail
	var/thumbnail_url = CONFIG_GET(string/roundend_thumbnail_url)
	if(thumbnail_url && length(thumbnail_url))
		embed.thumbnail = new(thumbnail_url)

	// Footer
	embed.footer = new("Раунд #[GLOB.round_id] ([SSgamemode.storyteller.name])")
	embed.timestamp = time2text(world.timeofday, "YYYY-MM-DD hh:mm:ss")

	var/datum/tgs_message_content/message = new("# Раунд под номером #[GLOB.round_id] ([SSgamemode.storyteller.name]) только что закончился, заходи в новый - https://white.ss13-bluemoon.ru/. [CONFIG_GET(string/roundend_ping_role) ? "<@&[CONFIG_GET(string/roundend_ping_role)]>" : ""]")
	message.embed = embed

	var/list/random_links = init_discord_videos()
	var/random_link = pick(random_links)
	if(!random_links)
		random_link = "Видосики не найдены."
	var/message_for_video = pick(CONFIG_GET(str_list/randomizing_message_for_video))
	var/last_roundend_message = "**[message_for_video]**\n [random_link]"
	var/datum/tgs_message_content/random_message = new(last_roundend_message)
	for(var/channel_tag in CONFIG_GET(str_list/channel_announce_new_game))
		send2chat(message, channel_tag)
		spawn(5)
			send2chat(random_message, channel_tag)

#undef FUNNY_VIDEOS_FILE_NAME
