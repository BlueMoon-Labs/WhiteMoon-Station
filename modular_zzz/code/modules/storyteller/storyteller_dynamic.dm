/datum/storyteller/dynamic
	name = "Dynamic (Player Dependent Dynamic)"
	desc = "Тип Динамика будет выбран в зависимости от количества игроков (ПРОЖАВШИХ READY) и их предпочитаемого уровня Хаоса. Предпочитаемый уровень хаоса можно выбрать в настройках (GAME OPTIONS > Your Chaos Level)."
	votable = TRUE

/proc/pick_dynamic_storyteller_type_by_chaos(list/players)
	var/total_chaos = 0
	for(var/mob/player as anything in players)
		if(!player || !player.client || !player.client.prefs)
			continue
		var/chaos = player.client.prefs.read_preference(/datum/preference/numeric/preferred_chaos_level)
		if(isnum(chaos))
			total_chaos += chaos

	var/storyteller_type
	if(total_chaos >= CONFIG_GET(number/chaos_for_a_hard_storyteller))
		storyteller_type = /datum/storyteller/high
	else if(total_chaos >= CONFIG_GET(number/chaos_for_a_medium_storyteller))
		storyteller_type = /datum/storyteller/medium
	else
		storyteller_type = /datum/storyteller/low

	message_admins("Выбранный Динамик: [storyteller_type]. Количество игроков - [players.len]. \
	Уровень хаоса от игроков - [total_chaos]. [CONFIG_GET(number/chaos_for_a_medium_storyteller)] \
	было нужно для Медиум-Динамика. [CONFIG_GET(number/chaos_for_a_hard_storyteller)] было нужно для Хард-Динамика.")
	return storyteller_type
