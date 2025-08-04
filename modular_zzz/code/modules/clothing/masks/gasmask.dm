/obj/item/clothing/mask/gas/syndicate
	icon = 'modular_zzz/icons/obj/clothing/masks/mask.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/mask.dmi'
	// worn_icon_muzzled = 'modular_zzz/icons/mob/clothing/mask_muzzled.dmi'

/obj/item/clothing/mask/gas/syndicate/cool_version
	name = "Tactical Catcrin Gasmask"
	desc = "A mask with a red visor and special filters. It seems to have a kind of cat whiskers on it."
	icon_state = "syndicate_cool"
	actions_types = list(/datum/action/item_action/maskhalt)

/datum/action/item_action/maskhalt
	name = "HALT!"

/obj/item/clothing/mask/gas/syndicate/cool_version/verb/maskhalt()
	set category = "Object"
	set name = "HALT!"
	set src in usr
	if(!isliving(usr))
		return
	if(!can_use(usr))
		return

	var/frase
	frase = input("Какую фразу вы хотите сказать через преобразователь в маске?","") as text

	if(frase)
		usr.audible_message("<b>[usr]</b> exclaims, \"<font color='red' size='4'><b>[frase]</b></font>\"")
		switch(rand(0,3))
			if(0)
				playsound(src.loc, 'modular_zzz/sound/misc/catcrin_halt0.ogg', 100, 1)
			if(1)
				playsound(src.loc, 'modular_zzz/sound/misc/catcrin_halt1.ogg', 100, 1)
			if(2)
				playsound(src.loc, 'modular_zzz/sound/misc/catcrin_halt2.ogg', 100, 1)
			if(3)
				playsound(src.loc, 'modular_zzz/sound/misc/catcrin_halt3.ogg', 100, 1)

/obj/item/clothing/mask/gas/syndicate/cool_version/ui_action_click(mob/user, action)
	if(istype(action, /datum/action/item_action/maskhalt))
		maskhalt()

/obj/item/clothing/mask/gas/syndicate/blackcool_version
	name = "CFIS Gasmask"
	desc = "Tactical gasmask for Catcrin Foreign Intelligence Service operatives. The compact mask has dark glass and small filters in the front part of the mask with breath venting."
	icon_state = "syndicate_blackcool"

/obj/item/clothing/mask/gas/syndicate/yekitezh
	name = "M1062"
	desc = "Standard military issue gas mask, it replaced the previous M55 gas mask series in Yekitezh Army."
	icon_state = "m1062"

/obj/item/clothing/mask/gas/syndicate/yekitezh_red
	name = "M1062-B"
	desc = "Standard military gas mask of the Yekitezh Army, except this one optimized with glowing red lenses and black coverage for 'tactical' issues."
	icon_state = "m1062b"

/obj/item/clothing/mask/gas/syndicate/cool_version/judas_version
	name = "Andromeda Mask"
	desc = "A close-fitting tactical mask used by shark-like species. It has moderate protection against ballistic damage and a flap for closed breathing."
	icon_state = "akula_mask"

/obj/item/clothing/mask/gas/syndicate/cool_version/catcrin_combatmask_one
	name = "Tactical combat Catcrin gasmask"
	desc = "Gasmask with special visor and filters that typicaly used in the Catcrin army."
	icon_state = "catcrin_one"

/obj/item/clothing/mask/gas/syndicate/cool_version/catcrin_combatmask_two
	name = "Tactical combat Catcrin gasmask"
	desc = "Gasmask with special visor and filters that typicaly used in the Catcrin army."
	icon_state = "catcrin_two"

/obj/item/clothing/mask/gas/syndicate/cool_version/catcrin_combatmask_three
	name = "Tactical combat Catcrin gasmask"
	desc = "Gasmask with special visor and filters that typicaly used in the Catcrin army."
	icon_state = "catcrin_three"

/obj/item/clothing/mask/gas/syndicate/mtb
	name = "Monocular Tactical Balaclava"
	desc = "A sinister, one-eyed balaclava designed for Nanotrasen's black-ops operatives and elite riot control specialists. This unnerving mask obscures all facial features except for a single, red blinking eye — enhanced with an unknown-type monocle. Whether you're lurking in maintenance, conducting midnight deitys, or just trying to psychologically unnerve the clown, this mask ensures you see everything... while remaining a faceless enigma of papa Nanotrasen."
	icon_state = "mtb"

/obj/item/cigarette/pipe/long_pipe
	name = "Long smoking pipe"
	desc = "A long smoking pipe made in a sophisticated style, with a small bulge at the end for dry herbs."
	icon = 'modular_zzz/icons/obj/clothing/masks/mask.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/mask.dmi'
	icon_state = "donator_pipeoff"
	icon_on = "donator_pipeoff"
	icon_off = "donator_pipeoff"

/obj/item/clothing/mask/balaclava/breath
	name = "Breathaclava"
	clothing_flags = BLOCK_GAS_SMOKE_EFFECT | MASKINTERNALS | GAS_FILTERING

/obj/item/clothing/mask/gas/syndicate/eo95_mask
	name = "EO-95 mask"
	desc = "A mask with ariral design, emits  a strange purple particles around it, allow the user to breath more cleaner air, that would be safer for it's owner because of anatomy of arirals."
	icon_state = "eo95_mask"
