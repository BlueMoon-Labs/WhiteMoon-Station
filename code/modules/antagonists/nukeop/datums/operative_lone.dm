/datum/team/nuclear/loneop/inteq
	core_objective = /datum/objective/nuclear/revert

/datum/objective/nuclear/revert
	name = "revert_nuclear"
	explanation_text = "Защити Космическую Станцию и Ядерный Диск любой ценой."

/datum/objective/nuclear/check_completion()
	if(GLOB.station_was_nuked)
		return FALSE
	return TRUE

/datum/antagonist/nukeop/lone
	name = "Lone Operative"
	send_to_spawnpoint = FALSE //Handled by event
	nukeop_outfit = /datum/outfit/syndicate/full/loneop
	preview_outfit = /datum/outfit/nuclear_operative
	preview_outfit_behind = null
	nuke_icon_state = null

/datum/antagonist/nukeop/lone/create_team(datum/team/nuclear/new_team)
	if(new_team)
		return ..()
	// Lone ops always get a solo team solely because a lot of nukie code is on the team
	nuke_team = new /datum/team/nuclear/loneop/inteq()
