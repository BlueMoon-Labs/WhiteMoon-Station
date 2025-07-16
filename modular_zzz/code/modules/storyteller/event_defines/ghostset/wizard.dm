/datum/round_event_control/antagonist/solo/wizard
	name = "Wizard"
	roundstart = TRUE

	antag_flag = ROLE_WIZARD
	antag_datum = /datum/antagonist/wizard

	weight = 2
	tags = list(TAG_COMBAT, TAG_SPOOKY, TAG_CREW_ANTAG, TAG_HIGH)

	maximum_antags_global = 1
	min_players = 50

/datum/round_event_control/wizard_midround
	name = ROLE_WIZARD_MIDROUND
	typepath = /datum/round_event/ghost_role/wizard_midround
	tags = list(TAG_COMBAT, TAG_SPOOKY, TAG_CREW_ANTAG, TAG_HIGH)
	track = EVENT_TRACK_GHOSTSET
	weight = 2
	category = EVENT_CATEGORY_INVASION
	min_players = 50

/datum/round_event/ghost_role/wizard_midround
	role_name = ROLE_WIZARD_MIDROUND
	minimum_required = 1
	fakeable = FALSE

/datum/round_event/ghost_role/wizard_midround/spawn_role()
	SSmapping.lazy_load_template(LAZY_TEMPLATE_KEY_WIZARDDEN)
	if(!GLOB.wizardstart.len)
		return MAP_ERROR
	var/mob/chosen_one = SSpolling.poll_ghost_candidates(check_jobban = ROLE_WIZARD, role = ROLE_WIZARD_MIDROUND, alert_pic = /obj/item/clothing/head/wizard, amount_to_pick = 1)
	if(isnull(chosen_one))
		return NOT_ENOUGH_PLAYERS
	var/mob/living/carbon/human/wiz = new(pick(GLOB.wizardstart))
	var/datum/mind/Mind = new /datum/mind(chosen_one.key)
	Mind.active = TRUE
	Mind.transfer_to(wiz)
	// wiz.PossessByPlayer(chosen_one.key)
	wiz.client?.prefs.safe_transfer_prefs_to(wiz)
	wiz.dna.remove_all_mutations()
	wiz.dna.update_dna_identity()
	Mind.set_assigned_role(SSjob.get_job_type(/datum/job/space_wizard))
	Mind.add_antag_datum(/datum/antagonist/wizard)
	message_admins("[ADMIN_LOOKUPFLW(wiz)] has been made into space wizard by an event.")
	wiz.log_message("was spawned as a space wizard by an event.", LOG_GAME)
	spawned_mobs += wiz
	return SUCCESSFUL_SPAWN
