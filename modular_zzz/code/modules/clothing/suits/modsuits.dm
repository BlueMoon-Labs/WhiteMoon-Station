// /obj/item/clothing/head/mod
// 	supports_variations_flags = CLOTHING_SNOUTED_VARIATION
// 	worn_icon_muzzled = 'modular_skyrat/master_files/icons/mob/mod.dmi'
// 	worn_icon_vox = 'modular_skyrat/modules/better_vox/icons/clothing/mod.dmi'
// 	worn_icon_better_vox = 'modular_skyrat/modules/better_vox/icons/clothing/mod.dmi'

// /obj/item/clothing/suit/mod
// 	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION
// 	worn_icon_digi = 'modular_skyrat/master_files/icons/mob/mod.dmi'
// 	worn_icon_better_vox = 'modular_skyrat/modules/better_vox/icons/clothing/mod.dmi'

// /obj/item/clothing/gloves/mod
// 	supports_variations_flags = NONE
// 	worn_icon_better_vox = 'modular_skyrat/modules/better_vox/icons/clothing/mod.dmi'

// /obj/item/clothing/shoes/mod
// 	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION
// 	worn_icon_digi = 'modular_skyrat/master_files/icons/mob/mod.dmi'
// 	worn_icon_better_vox = 'modular_skyrat/modules/better_vox/icons/clothing/mod.dmi'

// /obj/item/mod/control
// 	worn_icon_better_vox = 'modular_skyrat/modules/better_vox/icons/clothing/mod_modules.dmi'

/obj/item/mod/module/flashlight/improved
	name = "MOD Flashlight MK2 module"
	light_range = 5
	min_range = 2
	max_range = 10

/obj/item/mod/control/pre_equipped/vanguard
	theme = /datum/mod_theme/vanguard
	applied_modules = list(
		/obj/item/mod/module/storage/large_capacity,
		/obj/item/mod/module/jetpack,
	)
	default_pins = list(
		/obj/item/mod/module/jetpack,
	)

/datum/mod_theme/vanguard
	name = "vanguard"
	desc = "Армированный МОД, в котором не страшно ступить даже в самые опасные заброшенные станции и обломки кораблей."
	extended_desc = "Армированный МОД, в котором не страшно ступить даже в самые опасные заброшенные станции и обломки кораблей."
	default_skin = "vanguard"
	armor_type = /datum/armor/mod_theme_security
	complexity_max = DEFAULT_MAX_COMPLEXITY - 2
	slowdown_deployed = 0.5
	inbuilt_modules = list(/obj/item/mod/module/gps, /obj/item/mod/module/flashlight/improved)
	allowed_suit_storage = list(
		/obj/item/reagent_containers/spray/pepper,
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/gun,
	)
	variants = list(
		"vanguard" = list(

			MOD_ICON_OVERRIDE = 'modular_zzz/icons/obj/clothing/suits/mod.dmi',
			MOD_WORN_ICON_OVERRIDE = 'modular_zzz/icons/mob/clothing/suits/mod.dmi',

			/obj/item/clothing/head/mod = list(
				UNSEALED_CLOTHING = SNUG_FIT|THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE|HEADINTERNALS,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEEARS|HIDEHAIR|HIDESNOUT,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEYES|HIDEFACE,
				UNSEALED_COVER = HEADCOVERSMOUTH,
				SEALED_COVER = HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/obj/item/mod/module/energy_shield/inteq
	shield_icon = "shield-yellow"

/obj/item/mod/control/pre_equipped/inteqe
	theme = /datum/mod_theme/inteqe
	starting_frequency = MODLINK_FREQ_CENTCOM
	applied_cell = /obj/item/stock_parts/power_store/cell/bluespace
	applied_modules = list(
		/obj/item/mod/module/storage/syndicate,
		/obj/item/mod/module/shock_absorber,
		/obj/item/mod/module/emp_shield,
		/obj/item/mod/module/magnetic_harness,
		/obj/item/mod/module/jetpack,
		/obj/item/mod/module/flashlight,
		/obj/item/mod/module/dna_lock,
		/obj/item/mod/module/hat_stabilizer/syndicate,
		/obj/item/mod/module/quick_cuff,
		/obj/item/mod/module/shove_blocker,
	)
	default_pins = list(
		/obj/item/mod/module/welding/syndicate,
		/obj/item/mod/module/jetpack/advanced,
	)

/datum/mod_theme/inteqe
	name = "inteq"
	desc = "An elite suit developed by PMC InteQ engineers, offering upgraded armor values."
	extended_desc = "A huge upgrade of the syndicate suit, featuring a bulkier build and a matte dark color scheme, \
		this suit is only produced for InteQ Vanguards and heavily weaponized strike teams. \
		It comes built with a secondary layering of ceramic and Kevlar into the plating providing it with \
		exceptionally better protection along with fire and acid proofing."
	default_skin = "inteqe"
	armor_type = /datum/armor/mod_theme_responsory
	resistance_flags = FIRE_PROOF|ACID_PROOF
	atom_flags = PREVENT_CONTENTS_EXPLOSION_1
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	complexity_max = DEFAULT_MAX_COMPLEXITY
	siemens_coefficient = 0
	slowdown_deployed = 0
	ui_theme = "inteq"
	inbuilt_modules = list(/obj/item/mod/module/welding/syndicate)
	allowed_suit_storage = list(
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)
	variants = list(
		"inteqe" = list(

			MOD_ICON_OVERRIDE = 'modular_zzz/icons/obj/clothing/suits/mod.dmi',
			MOD_WORN_ICON_OVERRIDE = 'modular_zzz/icons/mob/clothing/suits/mod.dmi',

			/obj/item/clothing/head/mod = list(
				UNSEALED_LAYER = NECK_LAYER,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE|BLOCK_GAS_SMOKE_EFFECT|HEADINTERNALS,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/obj/item/mod/control/pre_equipped/inteqe/elite
	theme = /datum/mod_theme/inteqe/elite

/obj/item/mod/control/pre_equipped/inteqe/pirate
	starting_frequency = MODLINK_FREQ_SYNDICATE

/obj/item/mod/control/pre_equipped/inteqe/elite/pirate
	starting_frequency = MODLINK_FREQ_SYNDICATE

/datum/mod_theme/inteqe/elite
	name = "inteq"
	desc = "An elite suit developed by PMC InteQ engineers, offering upgraded armor values."
	extended_desc = "A huge upgrade of the syndicate suit, featuring a bulkier build and a matte dark color scheme, \
		this suit is only produced for InteQ Vanguards and heavily weaponized strike teams. \
		It comes built with a secondary layering of ceramic and Kevlar into the plating providing it with \
		exceptionally better protection along with fire and acid proofing."
	default_skin = "inteqe"
	armor_type = /datum/armor/mod_theme_responsory
	resistance_flags = FIRE_PROOF|ACID_PROOF
	atom_flags = PREVENT_CONTENTS_EXPLOSION_1
	max_heat_protection_temperature = FIRE_IMMUNITY_MAX_TEMP_PROTECT
	complexity_max = DEFAULT_MAX_COMPLEXITY + 3
	siemens_coefficient = 0
	slowdown_deployed = 0
	ui_theme = "inteq"
	inbuilt_modules = list(/obj/item/mod/module/welding/syndicate, /obj/item/mod/module/energy_shield/inteq)
	allowed_suit_storage = list(
		/obj/item/restraints/handcuffs,
		/obj/item/assembly/flash,
		/obj/item/melee/baton,
		/obj/item/melee/energy/sword,
		/obj/item/shield/energy,
	)
	variants = list(
		"inteqe" = list(
		MOD_ICON_OVERRIDE = 'modular_zzz/icons/obj/clothing/suits/mod.dmi',
		MOD_WORN_ICON_OVERRIDE = 'modular_zzz/icons/mob/clothing/suits/mod.dmi',
			/obj/item/clothing/head/mod = list(
				UNSEALED_LAYER = NECK_LAYER,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE|BLOCK_GAS_SMOKE_EFFECT|HEADINTERNALS,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)

/datum/mod_theme/blueshield
	variants = list(
		"praetorian" = list(
			MOD_ICON_OVERRIDE = 'modular_skyrat/modules/blueshield/icons/praetorian.dmi',
			MOD_WORN_ICON_OVERRIDE = 'modular_skyrat/modules/blueshield/icons/worn_praetorian.dmi',
			/obj/item/clothing/head/mod = list(
				UNSEALED_LAYER = null,
				UNSEALED_CLOTHING = SNUG_FIT|THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE|HEADINTERNALS,
				UNSEALED_INVISIBILITY = HIDEEARS|HIDEHAIR,
				SEALED_INVISIBILITY = HIDEFACIALHAIR|HIDEMASK|HIDEEYES|HIDEFACE|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
		"blacksec" = list(
		MOD_ICON_OVERRIDE = 'modular_zzz/icons/obj/clothing/suits/mod.dmi',
		MOD_WORN_ICON_OVERRIDE = 'modular_zzz/icons/mob/clothing/suits/mod.dmi',
			/obj/item/clothing/head/mod = list(
				UNSEALED_LAYER = NECK_LAYER,
				UNSEALED_CLOTHING = SNUG_FIT,
				SEALED_CLOTHING = THICKMATERIAL|STOPSPRESSUREDAMAGE|BLOCK_GAS_SMOKE_EFFECT|HEADINTERNALS,
				UNSEALED_INVISIBILITY = HIDEFACIALHAIR,
				SEALED_INVISIBILITY = HIDEMASK|HIDEEARS|HIDEEYES|HIDEFACE|HIDEHAIR|HIDESNOUT,
				SEALED_COVER = HEADCOVERSMOUTH|HEADCOVERSEYES|PEPPERPROOF,
				UNSEALED_MESSAGE = HELMET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = HELMET_SEAL_MESSAGE,
			),
			/obj/item/clothing/suit/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				SEALED_INVISIBILITY = HIDEJUMPSUIT,
				UNSEALED_MESSAGE = CHESTPLATE_UNSEAL_MESSAGE,
				SEALED_MESSAGE = CHESTPLATE_SEAL_MESSAGE,
			),
			/obj/item/clothing/gloves/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = GAUNTLET_UNSEAL_MESSAGE,
				SEALED_MESSAGE = GAUNTLET_SEAL_MESSAGE,
			),
			/obj/item/clothing/shoes/mod = list(
				UNSEALED_CLOTHING = THICKMATERIAL,
				SEALED_CLOTHING = STOPSPRESSUREDAMAGE,
				CAN_OVERSLOT = TRUE,
				UNSEALED_MESSAGE = BOOT_UNSEAL_MESSAGE,
				SEALED_MESSAGE = BOOT_SEAL_MESSAGE,
			),
		),
	)
