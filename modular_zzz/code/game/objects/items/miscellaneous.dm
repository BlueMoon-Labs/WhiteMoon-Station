/obj/item/choice_beacon/personal_pets
	name = "Personal pets beacon"
	desc = "Summon your personal pet."
	icon_state = "sb_delivery"
	inhand_icon_state = "sb_delivery"
	w_class = WEIGHT_CLASS_TINY

/obj/item/choice_beacon/personal_pets/generate_display_names()
	var/static/list/pets
	if(!pets)
		pets = list(
		"Danik" = /mob/living/basic/pet/dog/corgi/danik,
		"Korka" = /mob/living/basic/pet/fox/eldritch_fennec,
		"Moro" = /mob/living/basic/pet/cat/moro,
		"Dolbajob" = /mob/living/basic/pet/dog/corgi/Lisa/ada,
		"Judas" = /mob/living/basic/pet/dog/juda,
		"Ordinary" = /mob/living/basic/pet/fox/emma,
		)
	return pets

/obj/item/choice_beacon/personal_allowed_pets
	name = "Personal pets beacon"
	desc = "Summon your personal pet."
	icon_state = "sb_delivery"
	inhand_icon_state = "sb_delivery"
	w_class = WEIGHT_CLASS_TINY

/obj/item/choice_beacon/personal_allowed_pets/generate_display_names()
	var/static/list/pets
	if(!pets)
		pets = list(
		"Alta" = /mob/living/basic/pet/cat/alta,
		"Space Alta" = /mob/living/basic/pet/cat/space/alta,
		"Jruttie" = /mob/living/basic/pet/cat/jruttie,
		"Space Aiko" = /mob/living/basic/pet/fox/renault/space_aiko
		)
	return pets

/obj/item/banner/irellia
	name = "Banner of the Irellia"
	icon = 'modular_zzz/icons/obj/accessories.dmi'
	icon_state = "banner-irellia"
	desc = "Banner of the Irellia"

/obj/item/banner/rohai
	name = "Banner of the Rohai empire"
	icon = 'modular_zzz/icons/obj/accessories.dmi'
	icon_state = "banner-rohai"
	desc = "Banner of the Rohai empire"

/obj/item/banner/norn
	name = "Banner of kingdom Norn"
	icon = 'modular_zzz/icons/obj/accessories.dmi'
	icon_state = "banner-norn"
	desc = "Banner of kingdom Norn"

/obj/item/banner/catcrin
	name = "Banner of Catcrin Empire"
	icon = 'modular_zzz/icons/obj/accessories.dmi'
	icon_state = "banner_catcrin"
	desc = "Banner of Catcrin Empire"

/obj/item/sign/flag/catcrin
	name = "folded flag of the Catcrin Empire"
	desc = "The folded flag of the Catcrin Empire."
	icon = 'modular_zzz/icons/obj/accessories.dmi'
	icon_state = "flag_cetcrin"
	sign_path = /obj/structure/sign/flag/catcrin

/obj/structure/sign/flag/catcrin
	name = "flag of Catcrin Empire"
	desc = "The official flag of Catcrin Empire. Mostly flown as a ceremonial piece, or to mark land on a new frontier."
	icon = 'modular_zzz/icons/obj/accessories_32x48.dmi'
	icon_state = "flag_cetcrin"
	pixel_y = -12

/obj/item/clothing/accessory/ac_patch
	name = "PMC AC patch"
	desc = "Patch that wear every Mercenary  in PMC Adamas Cattus. It looks like a cat... Or dog... in the some sort of diamond.'"
	icon = 'modular_zzz/icons/obj/accessories.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/accessories.dmi'
	worn_icon_digi = 'modular_zzz/icons/mob/clothing/accessories.dmi'
	icon_state = "ac_patch"

/obj/item/storage/box/catcrin_kit
	name = "Catcrin kit"
	desc = "Regular box that contains a full kit of Catcrin accessories."

/obj/item/storage/box/catcrin_kit/PopulateContents()
	new /obj/item/clothing/accessory/ac_patch(src)
	new /obj/item/sign/flag/catcrin(src)
	new /obj/item/banner/catcrin(src)
