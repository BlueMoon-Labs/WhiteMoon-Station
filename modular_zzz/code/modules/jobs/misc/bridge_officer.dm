/datum/id_trim/job/bridge_assistant
	trim_icon = 'modular_zzz/icons/obj/card.dmi'
	trim_state = "trim_bridgeofficer"
	sechud_icon_state = SECHUD_BRIDGE_ASSISTANT
	minimal_access = list(
		ACCESS_COMMAND,
		ACCESS_EVA,
		ACCESS_GATEWAY,
		ACCESS_MAINT_TUNNELS,
		ACCESS_RC_ANNOUNCE,
		ACCESS_TELEPORTER,
		ACCESS_WEAPONS,
		ACCESS_CHANGE_IDS,
		ACCESS_HOP,
		ACCESS_JANITOR,
	)
	template_access = list(
		ACCESS_CAPTAIN,
	)
	job = /datum/job/bridge_assistant
	honorifics = list("Bridge Officer", "Underling", "Assistant", "Mate")
	honorific_positions = HONORIFIC_POSITION_FIRST | HONORIFIC_POSITION_LAST | HONORIFIC_POSITION_FIRST_FULL | HONORIFIC_POSITION_NONE

/datum/job/bridge_assistant
	paycheck = PAYCHECK_COMMAND
	paycheck_department = ACCOUNT_CIV

	liver_traits = list(TRAIT_PRETENDER_ROYAL_METABOLISM)

	display_order = JOB_DISPLAY_ORDER_BRIDGE_ASSISTANT

/datum/outfit/job/bridge_assistant
	name = "Bridge Officer"
	id = /obj/item/card/id/advanced/platinum
	implants = list(/obj/item/implant/mindshield)
