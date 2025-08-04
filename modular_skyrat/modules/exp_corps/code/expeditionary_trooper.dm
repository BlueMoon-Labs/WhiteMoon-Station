/obj/item/modular_computer/pda/expeditionary_corps
	greyscale_colors = "#891417#000099"
	icon_state = "/obj/item/modular_computer/pda/expeditionary_corps"
	name = "surplus military PDA"

/obj/item/storage/box/expeditionary_survival
	name = "expedition survival pack"
	desc = "A box filled with useful items for your expedition!"
	icon_state = "survival_pack"
	icon = 'modular_skyrat/modules/exp_corps/icons/survival_pack.dmi'
	illustration = null

/obj/item/storage/box/expeditionary_survival/PopulateContents()
	new /obj/item/storage/box/donkpockets(src)
	new /obj/item/flashlight/glowstick(src)
	new /obj/item/tank/internals/emergency_oxygen/double(src)
	new /obj/item/reagent_containers/cup/glass/waterbottle(src)
	new /obj/item/reagent_containers/blood/universal(src)
	new /obj/item/reagent_containers/syringe(src)
	new /obj/item/storage/pill_bottle/multiver(src)

/obj/structure/closet/crate/secure/exp_corps
	name = "Expedition Crate"
	icon_state = "expcrate"
	base_icon_state = "expcrate"
	icon = 'modular_skyrat/modules/exp_corps/icons/exp_crate.dmi'
	req_access = list(ACCESS_GATEWAY)
	var/loadout_desc = "Whoever picks this is an incredibly boring generalist."

/obj/structure/closet/crate/secure/exp_corps/pointman
	name = "Pointman Crate"
	loadout_desc = "The Pointman's role is to lead the expedition team from the front \
	lines, and has been outfitted with a Shield. Due to the manufacturing costs involved \
	the Pointman kit lacks when it comes to engineering and medical tools."

/obj/structure/closet/crate/secure/exp_corps/field_medic
	name = "Field Medic Crate"
	loadout_desc = "The Field Medic's role is to ensure that the expidition returns at all. \
	Their role as a supportive unit is vital, and they are outfitted with the tools required of \
	their duty. This comes at the cost of any engineering equipment."

/obj/structure/closet/crate/secure/exp_corps/combat_tech
	name = "Combat Tech Crate"
	loadout_desc = "A Combat Tech is always good for an expedition. Having someone with \
	mechanical know-how can mean life or death. A good role to bring along to any expedition. \
	Sadly, this kit is lacking when it comes to medical equipment."

/obj/structure/closet/crate/secure/exp_corps/marksman
	name = "Marksman Crate"
	loadout_desc = "A Combat Tech is always good for an expedition. Having someone with \
	mechanical know-how can mean life or death. A good role to bring along to any expedition. \
	Sadly, this kit is lacking when it comes to medical equipment."

//base, don't use this, but leaving it for admin spawns is probably a good call?
/obj/structure/closet/crate/secure/exp_corps/PopulateContents()
	new /obj/item/storage/medkit/tactical(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/color/black/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps(src)
	new /obj/item/mod/control/pre_equipped/vanguard(src)
	new /obj/item/clothing/under/rank/expeditionary_corps(src)
	new /obj/item/clothing/shoes/combat/expeditionary_corps(src)

//shield guy
/obj/structure/closet/crate/secure/exp_corps/pointman/PopulateContents()
	new /obj/item/storage/medkit/regular(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/color/black/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/pointman(src)
	new /obj/item/mod/control/pre_equipped/vanguard(src)
	new /obj/item/shield/riot/pointman(src)
	new /obj/item/clothing/under/rank/expeditionary_corps(src)
	new /obj/item/clothing/shoes/combat/expeditionary_corps(src)

//medic
/obj/structure/closet/crate/secure/exp_corps/field_medic/PopulateContents()
	new /obj/item/storage/medkit/expeditionary(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/clothing/gloves/latex/nitrile/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/field_medic(src)
	new /obj/item/mod/control/pre_equipped/vanguard(src)
	new /obj/item/healthanalyzer(src)
	new /obj/item/clothing/under/rank/expeditionary_corps(src)
	new /obj/item/clothing/shoes/combat/expeditionary_corps(src)

//engineer gaming
/obj/structure/closet/crate/secure/exp_corps/combat_tech/PopulateContents()
	new /obj/item/storage/medkit/emergency(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/clothing/glasses/welding/up(src)
	new /obj/item/radio(src)
	new /obj/item/melee/tomahawk(src)
	new /obj/item/clothing/gloves/chief_engineer/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/combat_tech(src)
	new /obj/item/mod/control/pre_equipped/vanguard(src)
	new /obj/item/skillchip/job/engineer(src)
	new /obj/item/storage/pouch/material(src)
	new /obj/item/clothing/under/rank/expeditionary_corps(src)
	new /obj/item/clothing/shoes/combat/expeditionary_corps(src)

//edgy loner with knives AND A FUKKEN gun
/obj/structure/closet/crate/secure/exp_corps/marksman/PopulateContents()
	new /obj/item/storage/medkit/regular(src)
	new /obj/item/storage/box/expeditionary_survival(src)
	new /obj/item/radio(src)
	new /obj/item/storage/pouch/ammo/marksman(src)
	new /obj/item/clothing/gloves/color/black/expeditionary_corps(src)
	new /obj/item/clothing/head/helmet/expeditionary_corps(src)
	new /obj/item/clothing/suit/armor/vest/expeditionary_corps(src)
	new /obj/item/storage/belt/military/expeditionary_corps/marksman(src)
	new /obj/item/mod/control/pre_equipped/vanguard(src)
	new /obj/item/storage/toolbox/guncase/skyrat/pistol/trappiste_small_case/skild(src)
	new /obj/item/clothing/under/rank/expeditionary_corps(src)
	new /obj/item/clothing/shoes/combat/expeditionary_corps(src)
