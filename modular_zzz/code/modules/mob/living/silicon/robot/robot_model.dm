// Zaka.WhiteMoon - Добавлен Тифлосион (Typhlsion) скин для борга. Заказ @SH1ORI; Спрайтеры @Skadi и @Sir.Soroka; Код @JustZaka (По просьбе)

/obj/item/robot_model/engineering/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"Typhlosion (Technician)" = list(
			SKIN_ICON_STATE = "typhlosion",
			SKIN_ICON = WHITEMOON_SKIN_ICON_ENG_TALL,
			SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_TALL),
			TALL_HAT_OFFSET
		)
	)

/obj/item/robot_model/security/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"Typhlosion (RedSec)" = list(
			SKIN_ICON_STATE = "typhlosion-red",
			SKIN_ICON = WHITEMOON_SKIN_ICON_SEC_TALL,
			SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_TALL),
			TALL_HAT_OFFSET
		),
		"Typhlosion (BlueSec)" = list(
			SKIN_ICON_STATE = "typhlosion-blue",
			SKIN_ICON = WHITEMOON_SKIN_ICON_SEC_TALL,
			SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_TALL),
			TALL_HAT_OFFSET
		)
	)

/obj/item/robot_model/medical/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"Typhlosion (Doc)" = list(
			SKIN_ICON_STATE = "typhlosion",
			SKIN_ICON = WHITEMOON_SKIN_ICON_MED_TALL,
			SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_TALL),
			TALL_HAT_OFFSET
		),
		"MAS" = list(
			SKIN_ICON_STATE = "mas",
			SKIN_ICON = WHITEMOON_SKIN_ICON_MED_WIDE,
			SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_WIDE, TRAIT_R_DOGBORG),
			HOUND_HAT_OFFSET
		)
	)


/obj/item/robot_model/janitor/Initialize(mapload)
	. = ..()
	borg_skins |= list(
		"Typhlosion (Maid)" = list(
		SKIN_ICON_STATE = "typhlosion",
		SKIN_ICON = WHITEMOON_SKIN_ICON_JANI_TALL,
		SKIN_FEATURES = list(TRAIT_R_UNIQUEWRECK, TRAIT_R_TALL),
		TALL_HAT_OFFSET
	)
)
