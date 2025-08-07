/*
*	ASSAULT OPERATIVES
*/

/datum/round_event_control/antagonist/team/assault_operatives
	name = "Assault Operatives"
	roundstart = TRUE

	antag_flag = ROLE_ASSAULT_OPERATIVE
	antag_datum = /datum/antagonist/assault_operative

	weight = 3
	tags = list(TAG_CREW_ANTAG, TAG_CHAOTIC, TAG_MEDIUM)

	base_antags = 2
	maximum_antags = 5
	maximum_antags_global = 5

	typepath = /datum/round_event/antagonist/team/assault_nukie

/datum/round_event/antagonist/team/assault_nukie
	var/datum/job/job_type = /datum/job/assault_operative

/datum/round_event/antagonist/team/assault_nukie/candidate_roles_setup(mob/candidate)
	candidate.mind.set_assigned_role(SSjob.get_job_type(job_type))
