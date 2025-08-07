/obj/item/summon_beacon/expedition_surplus
	name = "expedition corps supply beacon"
	desc = "Used to request your job supplies, use in hand to do so!"

	allowed_areas = list(
		/area/awaymission,
		/area/station/command/gateway,
	)

	selectable_atoms = list(
		/obj/structure/closet/crate/secure/exp_corps/marksman,
		/obj/structure/closet/crate/secure/exp_corps/pointman,
		/obj/structure/closet/crate/secure/exp_corps/field_medic,
		/obj/structure/closet/crate/secure/exp_corps/combat_tech,
	)

	area_string = "the gateway chamber"

/datum/supply_pack/misc/vanguard_surplus
	cost = CARGO_CRATE_VALUE * 15
	access_view = ACCESS_GATEWAY
	access = ACCESS_GATEWAY
	contains = list(
		/obj/item/summon_beacon/expedition_surplus,
		/obj/item/modular_computer/pda/expeditionary_corps,
	)
