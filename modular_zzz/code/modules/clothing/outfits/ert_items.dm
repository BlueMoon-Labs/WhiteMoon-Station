/obj/item/storage/box/centcom
	name = "Centcom Box"
	desc = "It's just an ordinary box."
	icon_state = "internals_large"

/obj/item/storage/box/centcom/PopulateContents()
	var/static/items_inside = list(
		/obj/item/pinpointer/crew/centcom = 1,
		/obj/item/pinpointer/nuke = 1,
		/obj/item/tank/internals/emergency_oxygen/double = 1,
		/obj/item/reagent_containers/hypospray/medipen/atropine = 2,
		/obj/item/reagent_containers/hypospray/medipen/salacid = 1,
		/obj/item/crowbar/power/syndicate = 1,
		)
	generate_items_inside(items_inside,src)

/obj/item/pinpointer/crew/centcom
	name = "Centcom Pinpointer"
	desc = "A handheld tracking device that locks onto certain signals. Ignores suit sensors, but is much less accurate."
	icon = 'modular_zzz/icons/obj/device.dmi'
	icon_state = "pinpointer_centcom"
	worn_icon_state = "pinpointer_black"
	minimum_range = 5
	ignore_suit_sensor_level = TRUE

/obj/item/storage/box/m223_ammo
	name = "box with ammo"
	icon_state = "secbox"

/obj/item/storage/box/m223_ammo/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/m223 = 7,
		)
	generate_items_inside(items_inside,src)

/obj/item/storage/box/smgm45_ammo
	name = "box with ammo"
	icon_state = "secbox"

/obj/item/storage/box/smgm45_ammo/PopulateContents()
	var/static/items_inside = list(
		/obj/item/ammo_box/magazine/smgm45 = 5,
		)
	generate_items_inside(items_inside,src)

/obj/item/melee/energy/sword/ert
	name = "Standart Energy Sword"
	desc = "To serve the Mega-Corporation."
	light_color = "#2d7ea1"
	sword_color_icon = "blue"

/obj/item/storage/belt/military/ert_min/PopulateContents()
	new /obj/item/knife/combat(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/restraints/legcuffs/bola/energy(src)
	new /obj/item/restraints/legcuffs/bola/energy(src)

/obj/item/storage/belt/military/ert_max/PopulateContents()
	new /obj/item/melee/energy/sword/ert(src)
	new /obj/item/restraints/handcuffs(src)
	new /obj/item/assembly/flash/handheld(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/grenade/flashbang(src)
	new /obj/item/restraints/legcuffs/bola/energy(src)
	new /obj/item/restraints/legcuffs/bola/energy(src)

/obj/item/storage/medkit/tactical/premium/ert
	name = "ERT Medical Kit"
	desc = "May or may not contain traces of lead."
	icon_state = "medkit_tactical_premium"
	inhand_icon_state = "medkit-tactical-premium"
	grind_results = list(/datum/reagent/lead = 10)
	storage_type = /datum/storage/medkit/tactical/premium

/obj/item/storage/medkit/tactical/premium/ert/PopulateContents()
	if(empty)
		return
	var/static/list/items_inside = list(
		/obj/item/healthanalyzer/advanced = 1,
		/obj/item/stack/medical/suture/medicated = 2,
		/obj/item/stack/medical/mesh/advanced = 2,
		/obj/item/reagent_containers/applicator/patch/synthflesh = 12,
		/obj/item/storage/pill_bottle/penacid = 1,
		/obj/item/reagent_containers/hypospray/combat/nanites = 1,
		/obj/item/stack/medical/gauze = 2,
		/obj/item/storage/box/bandages = 1,
	)
	generate_items_inside(items_inside,src)

/obj/item/clothing/suit/space/ntrauma/Initialize(mapload)
	. = ..()
	allowed += list(
		/obj/item/gun/ballistic,
		/obj/item/gun/energy,
		/obj/item/knife/combat,
		/obj/item/melee/baton,
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/storage/belt/holster/detective,
		/obj/item/storage/belt/holster/nukie,
		/obj/item/storage/belt/holster/energy,
		/obj/item/gun/ballistic/shotgun/automatic/combat/compact,
		/obj/item/pen/red/security,
	)

/obj/item/mod/control/pre_equipped/responsory
	theme = /datum/mod_theme/responsory
	applied_cell = /obj/item/stock_parts/power_store/cell/bluespace
	applied_modules = list(
		/obj/item/mod/module/storage/bluespace,
		/obj/item/mod/module/welding,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/jetpack/advanced,
	)

/datum/mod_theme/responsory
	armor_type = /datum/armor/mod_theme_corporate

/datum/mod_theme/responsory/budget
	armor_type = /datum/armor/mod_theme_responsory

/obj/item/mod/control/pre_equipped/responsory/budget
	theme = /datum/mod_theme/responsory/budget
	applied_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/welding,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/quick_cuff,
	)

/obj/item/mod/control/pre_equipped/responsory/budget/commander
	insignia_type = /obj/item/mod/module/insignia/commander
	additional_modules = /obj/item/mod/module/power_kick

/obj/item/mod/control/pre_equipped/responsory/budget/security
	insignia_type = /obj/item/mod/module/insignia/security
	additional_modules = /obj/item/mod/module/pepper_shoulders

/obj/item/mod/control/pre_equipped/responsory/budget/engineer
	insignia_type = /obj/item/mod/module/insignia/engineer
	additional_modules = /obj/item/mod/module/rad_protection

/obj/item/mod/control/pre_equipped/responsory/budget/medic
	insignia_type = /obj/item/mod/module/insignia/medic
	additional_modules = /obj/item/mod/module/quick_carry
