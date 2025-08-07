/obj/item/clothing/neck/cloak/tendercloak
	name = "bayou old mantle"
	desc = "This is a very shabby (and time-worn) cape, it smells funny of silt."
	icon = 'modular_zzz/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/neck.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/neck.dmi'
	icon_state = "ten_neck"

/obj/item/clothing/neck/corvuspendant
	name = "Corvus Pendant"
	desc = "Ravens in black with eyes so keen, steal pendants bright with silver sheen."
	icon = 'modular_zzz/icons/obj/clothing/neck.dmi'
	icon_state = "cp"
	worn_icon = 'modular_zzz/icons/mob/clothing/neck.dmi'
	body_parts_covered = CHEST|GROIN|LEGS|ARMS
	uses_advanced_reskins = TRUE
	unique_reskin = list(
		"Corvus Pendant" = list(
			RESKIN_ICON_STATE = "pendant",
			RESKIN_WORN_ICON_STATE = "pendant"
		),
		"Corvus Cape" = list(
			RESKIN_ICON_STATE = "cape",
			RESKIN_WORN_ICON_STATE = "cape"
		)
	)

/obj/item/clothing/neck/cloak/merc_coat_nt
	name = "Nanotrasen Coat"
	desc = "Nanotrasen Coat."
	icon_state = "merc_coat_nt"
	icon = 'modular_zzz/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/neck.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/neck.dmi'

/obj/item/clothing/neck/cloak/merc_coat_nt/alt
	name = "Suspicious Coat"
	desc = "Suspicious Coat."
	icon_state = "merc_coat_synd"

/obj/item/clothing/neck/cloak/eidolon_cape
	name = "Eidolon officer cape"
	desc = "A cape of MI13 operatives who have proven themself in Eidolon corporation, infused with purple energy it looks very stylish and even do not restrict movement."
	icon = 'modular_zzz/icons/obj/clothing/neck.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/neck.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/neck.dmi'
	icon_state = "eidolon_cape"

/obj/item/clothing/neck/cloak/colonial
	slot_flags = ITEM_SLOT_NECK

/obj/item/clothing/suit/hooded/cloak/zuliecloak
	slot_flags = ITEM_SLOT_NECK
