/datum/round_event_control/aurora_caelus
	name = "Aurora Caelus"
	typepath = /datum/round_event/aurora_caelus
	max_occurrences = 1
	weight = 1
	earliest_start = 5 MINUTES
	category = EVENT_CATEGORY_FRIENDLY
	description = "Через отдельные окна можно увидеть красочную экспозицию."

/datum/round_event_control/aurora_caelus/can_spawn_event(players, allow_magic = FALSE)
	if(!SSmapping.empty_space)
		return FALSE
	return ..()

/datum/round_event/aurora_caelus
	announce_when = 1
	start_when = 21
	end_when = 80

/datum/round_event/aurora_caelus/announce(fake)
	priority_announce("[station_name()]: Безвредное облако ионов приближается к вашей станции, истощая свою энергию и стукаясь о корпус. Nanotrasen разрешает всем сотрудникам сделать короткий перерыв, чтобы расслабиться и понаблюдать за этим редким событием. В это время звездный свет будет ярким, но мягким, переходя от тихого зеленого к яркому синему цвету. Любой сотрудник, желающий увидеть эти огни самостоятельно, может отправиться в ближайший к ним район с видом на космос. Надеемся, что вам понравится это сияние.",
	sound = SSstation.announcer.event_sounds[ANNOUNCER_AURORA_CAELUS] || 'sound/announcer/notice/notice2.ogg', // SPLURT EDIT - ORIGINAL: sound = 'sound/announcer/notice/notice2.ogg',
	sender_override = "Отдел Метеорологии Nanotrasen")
	if (fake)
		return
	for(var/V in GLOB.player_list)
		var/mob/M = V
		var/pref_volume = M.client.prefs.read_preference(/datum/preference/numeric/volume/sound_midi)
		if(pref_volume > 0 && is_station_level(M.z))
			M.playsound_local(M, 'sound/ambience/aurora_caelus/aurora_caelus.ogg', 20 * (pref_volume/100), FALSE, pressure_affected = FALSE)
	fade_space(fade_in = TRUE)
	fade_kitchen(fade_in = TRUE)

/datum/round_event/aurora_caelus/start()
	for(var/mob/living/carbon/human/player in GLOB.alive_mob_list)
		if(is_station_level(player.z))
			player.apply_status_effect(/datum/status_effect/pacify, 123 SECONDS)

	var/list/human_blacklist = list()
	for(var/area/station/service/kitchen/affected_area in GLOB.areas)
		var/obj/machinery/oven/roast_ruiner = locate() in affected_area
		if(roast_ruiner)
			roast_ruiner.balloon_alert_to_viewers("oh egads!")
			var/turf/ruined_roast = get_turf(roast_ruiner)
			ruined_roast.atmos_spawn_air("[GAS_PLASMA]=100;[TURF_TEMPERATURE(1000)]")
			message_admins("Aurora Caelus event caused an oven to ignite at [ADMIN_VERBOSEJMP(ruined_roast)].")
			log_game("Aurora Caelus event caused an oven to ignite at [loc_name(ruined_roast)].")
			announce_to_ghosts(roast_ruiner)
			for(var/mob/living/carbon/human/seymour in viewers(roast_ruiner, 7))
				if (seymour in human_blacklist)
					continue
				human_blacklist += seymour
				if(seymour.mind && istype(seymour.mind.assigned_role, /datum/job/cook))
					seymour.say("My roast is ruined!!!", forced = "ruined roast")
					seymour.emote("scream")

/datum/round_event/aurora_caelus/tick()
	if(activeFor % 8 != 0)
		return
	var/aurora_color = hsl_gradient((activeFor - start_when) / (end_when - start_when), 0, "#A2FF80", 1, "#A2FFEE")
	set_starlight(aurora_color)

	for(var/area/station/service/kitchen/affected_area in GLOB.areas)
		for(var/turf/open/kitchen_floor in affected_area.get_turfs_from_all_zlevels())
			kitchen_floor.set_light(l_color = aurora_color)

/datum/round_event/aurora_caelus/end()
	fade_space()
	fade_kitchen()
	priority_announce("Событие, связанное с Космическим Сиянием, заканчивается. Звездный свет постепенно возвращается в нормальное состояние. Возвращайтесь на свое рабочее место и продолжайте работать в обычном режиме. Приятной смены [station_name()] и спасибо, что посмотрели за этим событием с нами.",
	sound = 'sound/announcer/notice/notice2.ogg',
	sender_override = "Отдел Метеорологии Nanotrasen")

/datum/round_event/aurora_caelus/proc/fade_space(fade_in = FALSE)
	set waitfor = FALSE
	// iterate all glass tiles
	var/start_color = hsl_gradient(1, 0, "#A2FF80", 1, "#A2FFEE")
	var/start_range = GLOB.starlight_range * 1.75
	var/start_power = GLOB.starlight_power * 0.6
	var/end_color = GLOB.base_starlight_color
	var/end_range = GLOB.starlight_range
	var/end_power = GLOB.starlight_power
	if(fade_in)
		end_color = hsl_gradient(0, 0, "#A2FF80", 1, "#A2FFEE")
		end_range = start_range
		end_power = start_power
		start_color = GLOB.base_starlight_color
		start_range = GLOB.starlight_range
		start_power = GLOB.starlight_power

	for(var/i in 1 to 5)
		var/walked_color = hsl_gradient(i/5, 0, start_color, 1, end_color)
		var/walked_range = LERP(start_range, end_range, i/5)
		var/walked_power = LERP(start_power, end_power, i/5)
		set_starlight(walked_color, walked_range, walked_power)
		sleep(8 SECONDS)
	set_starlight(end_color, end_range, end_power)

/datum/round_event/aurora_caelus/proc/fade_kitchen(fade_in = FALSE)
	set waitfor = FALSE
	var/start_color = hsl_gradient(1, 0, "#A2FF80", 1, "#A2FFEE")
	var/start_range = 1
	var/start_power = 0.75
	var/end_color = COLOR_BLACK
	var/end_range = 0.5
	var/end_power = 0
	if(fade_in)
		end_color = hsl_gradient(0, 0, "#A2FF80", 1, "#A2FFEE")
		end_range = start_range
		end_power = start_power
		start_color = COLOR_BLACK
		start_range = 0.5
		start_power = 0

	for(var/i in 1 to 5)
		var/walked_color = hsl_gradient(i/5, 0, start_color, 1, end_color)
		var/walked_range = LERP(start_range, end_range, i/5)
		var/walked_power = LERP(start_power, end_power, i/5)
		for(var/area/station/service/kitchen/affected_area in GLOB.areas)
			for(var/turf/open/kitchen_floor in affected_area.get_turfs_from_all_zlevels())
				kitchen_floor.set_light(walked_range, walked_power, walked_color)
		sleep(8 SECONDS)
	for(var/area/station/service/kitchen/affected_area in GLOB.areas)
		for(var/turf/open/kitchen_floor in affected_area.get_turfs_from_all_zlevels())
			kitchen_floor.set_light(end_range, end_power, end_color)
