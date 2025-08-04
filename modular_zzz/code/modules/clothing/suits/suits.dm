/obj/item/clothing/suit/toggle/noonar
	name = "Suspicious jacket"
	desc = "What a suspicious jacket..."
	icon = 'modular_zzz/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/suits.dmi'
	icon_state = "noonar"

/obj/item/clothing/suit/toggle/noonarlong
	name = "Long Suspicious jacket"
	desc = "what a long Suspicious jacket..."
	icon = 'modular_zzz/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/suits.dmi'
	icon_state = "noonarlong"

/obj/item/clothing/suit/hooded/ablative
	worn_icon_digi = 'modular_skyrat/master_files/icons/mob/clothing/suits/armor_digi.dmi'

/obj/item/clothing/suit/armor/rsa12
	name = "R-SA-12"
	desc = "The saboteur's lightweight armor is designed to provide sufficient protection while maintaining a high degree of freedom of movement and stealth, which is important for missions involving subversion, espionage, or stealthy infiltration. Once owned by the Asmalgan Church, but now bears the Rohai emblem on the chest."
	icon = 'modular_zzz/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/suits.dmi'
	icon_state = "rsa12"

/obj/item/clothing/suit/armor/rohai_armor
	name = "Rohai Infantry Armor"
	desc = "Standard protective set of infantryman of the Rohai Empire, made of polymers, usually tightly adjusted to its owner. On both shoulder pads you can see a symbol with two knives."
	icon = 'modular_zzz/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/suits.dmi'
	icon_state = "rohai_armor"

/obj/item/clothing/suit/toggle/kazeshini_cape
	name = "Kazeshini Cape"
	desc = "kazeshini cape."
	icon_state = "reaper_cape"
	icon = 'modular_zzz/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/suits.dmi'
	toggle_noun = "fire"
	body_parts_covered = ARMS|CHEST

/obj/item/clothing/suit/toggle/kazeshini_cape/Initialize(mapload)
	. = ..()
	allowed = GLOB.security_vest_allowed

/obj/item/clothing/suit/toggle/kazeshini_cape/alt
	name = "Alternative Kazeshini Cape"
	desc = "Alternative kazeshini cape."
	icon_state = "sectac_w"

/obj/item/clothing/neck/cloak/rev_mori
	name = "Revento Mori jacket"
	desc = "Revento Mori jacket, customised and tailored. The jacket is made of water-repellent materials, for extra protection of the outfit from water. The collar is embroidered with the company logo and embroidered initials E.W. There is also an embroidered cat's paw on the back"
	icon = 'modular_zzz/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/suits.dmi'
	slot_flags = ITEM_SLOT_OCLOTHING|ITEM_SLOT_NECK
	icon_state = "rev_mori"
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Revento Mori suit" = list(
			RESKIN_ICON_STATE = "rev_mori",
			RESKIN_WORN_ICON_STATE = "rev_mori_s"
		),
		"Revento Mori neck" = list(
			RESKIN_ICON_STATE = "rev_mori",
			RESKIN_WORN_ICON_STATE = "rev_mori_n"
		)
	)

/obj/item/clothing/suit/montur
	name = "Dark Montur"
	desc = "Reserved yet commanding, this uniform of MI13 is tailored from a heavy, matte fabric of deep coal-blue, absorbing ambient light. The form-fitting cut enhances the wearer’s silhouette without restricting movement."
	icon = 'modular_zzz/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/suits.dmi'
	lefthand_file = 'modular_zzz/icons/mob/clothing/lefthand.dmi'
	righthand_file = 'modular_zzz/icons/mob/clothing/righthand.dmi'
	icon_state = "montur"

/obj/item/clothing/suit/costume/striped_sweater
	supports_variations_flags = CLOTHING_DIGITIGRADE_VARIATION_NO_NEW_ICON
	body_parts_covered = CHEST|ARMS

/obj/item/clothing/suit/fixer_costume
	name = "Fixer Costume"
	desc = "Fixer Costume."
	icon_state = "fixer_costume"
	worn_icon_state = "fixer_costume"
	icon = 'modular_zzz/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/suits.dmi'
	supports_variations_flags = CLOTHING_NO_VARIATION

/obj/item/clothing/suit/armor/bluesec_jacket
	name = "Bluesec Jacket"
	desc = "Bluesec Jacket."
	icon_state = "bluesec_jacket"
	icon = 'modular_zzz/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/suits.dmi'
	supports_variations_flags = CLOTHING_NO_VARIATION

/obj/item/clothing/suit/armor/bluesec_jacket/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/toggle_icon)

/obj/item/clothing/suit/armor/bluesec_jacket/winter
	name = "Winter Bluesec Jacket"
	desc = "Winter Bluesec Jacket."
	icon_state = "bluesec_winter_jacket"

/obj/item/clothing/suit/armor/bluesec_jacket/reaper_jacket
	name = "Old Guard Jacket"
	desc = "Old Guard Jacket."
	icon_state = "reaper_jacket"

/obj/item/clothing/suit/armor/bluesec_jacket/winter/reaper_jacket
	name = "Old Winter Guard Jacket"
	desc = "Old Winter Guard Jacket."
	icon_state = "reaper_winter_jacket"
