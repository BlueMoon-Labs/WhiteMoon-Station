/obj/machinery/porta_turret/syndicate/irs/inteq
	shot_delay = 3
	lethal_projectile = /obj/projectile/bullet/c10mm/hp
	lethal_projectile_sound = 'sound/items/weapons/gun/smg/shot.ogg'
	stun_projectile = /obj/projectile/bullet/c10mm/hp
	stun_projectile_sound = 'sound/items/weapons/gun/smg/shot.ogg'
	armor_type = /datum/armor/syndicate_turret
	faction = list(FACTION_PIRATE)

/obj/machinery/porta_turret/syndicate/irs/inteq/assess_perp(mob/living/carbon/human/perp)
	if (!check_access(perp.wear_id?.GetID()))
		return 10
	return 0

/obj/item/clothing/head/helmet/space/syndicate/black/inteq
	name = "brown combat space helmet"
	icon_state = "space-inteq"
	inhand_icon_state = "syndicate-helm-orange"
	icon = 'modular_zzz/icons/obj/clothing/heads.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/heads.dmi'

/obj/item/clothing/suit/space/syndicate/black/inteq
	name = "brown combat space suit"
	icon_state = "space-inteq"
	inhand_icon_state = "syndicate-orange"
	icon = 'modular_zzz/icons/obj/clothing/suits.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/suits.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/suits_digi.dmi'
	helmet_type = /obj/item/clothing/head/helmet/space/syndicate/black/inteq

/obj/machinery/suit_storage_unit/inteq
	storage_type = /obj/item/tank/internals/oxygen/yellow
	suit_type = /obj/item/clothing/suit/space/syndicate/black/inteq
	helmet_type = /obj/item/clothing/head/helmet/space/syndicate/black/inteq

/obj/machinery/suit_storage_unit/inteq_mod
	storage_type = /obj/item/tank/internals/oxygen/yellow
	mod_type = /obj/item/mod/control/pre_equipped/inteqe
