// /*
// *	ASSAULT OPERATIVES
// */

// #define ASSAULT_OPERATIVES_COUNT 5

// /datum/round_event_control/antagonist/team/assault_operatives
// 	name = "Assault Operatives"
// 	roundstart = TRUE

// 	antag_flag = ROLE_ASSAULT_OPERATIVE
// 	antag_datum = /datum/antagonist/assault_operative

// 	weight = 0
// 	tags = list(TAG_CREW_ANTAG, TAG_CHAOTIC, TAG_MEDIUM)

// 	base_antags = 2
// 	maximum_antags = 5
// 	maximum_antags_global = 5

// 	typepath = /datum/round_event/antagonist/team/assault_nukie

// /datum/round_event/antagonist/team/assault_nukie
// 	var/datum/job/job_type = /datum/job/assault_operative
// 	var/required_role = ROLE_ASSAULT_OPERATIVE

// 	var/datum/team/assault_operatives/nuke_team

// /datum/round_event/antagonist/team/assault_nukie/candidate_roles_setup(mob/candidate)
// 	. = ..()
// 	// If ready() did its job, candidates should have 5 or more members in it
// 	for(var/operatives_number in 1 to ASSAULT_OPERATIVES_COUNT)
// 		if(candidates.len <= 0)
// 			break
// 		var/mob/candidate = pick_n_take(candidates)
// 		assigned += candidate.mind
// 		candidate.mind.set_assigned_role(SSjob.get_job_type(/datum/job/assault_operative))
// 		candidate.mind.special_role = ROLE_ASSAULT_OPERATIVE
// 		GLOB.pre_setup_antags += candidate.mind
// 	return TRUE

// /datum/round_event/antagonist/team/assault_nukie/start()
// 	assault_operatives_team = new()
// 	for(var/datum/mind/iterating_mind in assigned)
// 		GLOB.pre_setup_antags -= iterating_mind
// 		var/datum/antagonist/assault_operative/new_op = new antag_datum()
// 		iterating_mind.add_antag_datum(new_op, assault_operatives_team)
// 	if(assault_operatives_team.members.len)
// 		assault_operatives_team.update_objectives()
// 		SSgoldeneye.required_keys = get_goldeneye_key_count()
// 		return TRUE
// 	log_game("DYNAMIC: [ruletype] [name] failed to get any eligible assault operatives. Refunding [cost] threat.")
// 	return FALSE

// /// Returns the required goldeneye keys for activation. This is to make sure we don't have an impossible to achieve goal. However, there has to be at least one key.
// /datum/dynamic_ruleset/roundstart/assault_operatives/get_goldeneye_key_count()
// 	return clamp(LAZYLEN(SSjob.get_all_heads()), 1, GOLDENEYE_REQUIRED_KEYS_MAXIMUM)

// #undef ASSAULT_OPERATIVES_COUNT
