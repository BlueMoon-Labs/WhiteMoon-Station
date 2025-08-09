/datum/team/nuclear/loneop/inteq
	core_objective = /datum/objective/nuclear/revert

/datum/objective/nuclear/revert
	name = "revert_nuclear"
	explanation_text = "Защити Космическую Станцию и Ядерный Диск любой ценой."

/datum/objective/nuclear/check_completion()
	if(GLOB.station_was_nuked)
		return FALSE
	return TRUE
