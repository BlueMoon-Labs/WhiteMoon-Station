/obj/item/armorkit
	name = "rampart armor kit"
	desc = "A standard Nanotrasen security nanite armoring kit, for reinforcing outerwear."
	icon = 'modular_zzplurt/icons/obj/reinforcekits.dmi'
	icon_state = "sec_armor_kit"
	w_class = WEIGHT_CLASS_SMALL

	var/datum/armor/target_armor = /datum/armor/suit_armor // Holds the typepath of the armor.
	var/datum/armor/actual_armor // Holds the real datum of the armor.
	var/target_slot = ITEM_SLOT_OCLOTHING
	var/change_allowed = TRUE
	var/list/target_allowed // = GLOB.security_vest_allowed

	var/armor_text = "standard Nanotrasen security armored vest"
	var/target_prefix = "rampart"

/obj/item/armorkit/Initialize(mapload)
	. = ..()
	actual_armor = new target_armor(src)
	target_allowed = GLOB.security_vest_allowed // You're killing me here.

/obj/item/armorkit/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	var/used = FALSE

	if(!isobj(interacting_with))
		return FALSE

	var/obj/item/target = interacting_with

	if(!(target.slot_flags & target_slot))
		to_chat(user, "<span class = 'notice'>Вы не можете улучшить [target] при помощи [src].</span>")
		return FALSE

	var/obj/item/clothing/C = target
	var/datum/armor/curr_armor = C.get_armor()

	for(var/stat in ARMOR_LIST_DAMAGE())
		if(curr_armor.get_rating(stat) > 0)
			to_chat(user, "<span class='notice'>[C] уже имеет броню.</span>")
			return FALSE

	for(var/curr_stat in ARMOR_LIST_DAMAGE())
		if(!curr_armor.get_rating(curr_stat) || curr_armor.get_rating(curr_stat) < actual_armor.get_rating(curr_stat))
			C.set_armor_rating(curr_stat, actual_armor.get_rating(curr_stat))
			used = TRUE

	if(used)
		if(change_allowed)
			C.allowed = target_allowed
		user.visible_message("<span class = 'notice'>[user] улучшает [C] при помощи [src].</span>", \
		"<span class = 'notice'>Ты улучшаешь [C] до уровня [armor_text] при помощи [src]..</span>")
		C.name = "[target_prefix] [C.name]"
		qdel(src)
		return ITEM_INTERACT_SUCCESS

	to_chat(user, "<span class = 'notice'>Тебе больше не нужно улучшать [C].")
	return FALSE

/obj/item/armorkit/helmet
	name = "rampart headgear kit"
	desc = "A standard Nanotrasen security nanite armoring kit, for reinforcing hats or other headgear."
	icon_state = "sec_helmet_kit"

	target_armor = /datum/armor/head_helmet
	target_slot = ITEM_SLOT_HEAD
	change_allowed = FALSE
	// target_allowed = GLOB.security_vest_allowed

	armor_text = "standard Nanotrasen security helmet"
	// target_prefix = "rampart"

/obj/item/armorkit/blueshield
	name = "aegis armor kit"
	desc = "An elite Nanotrasen nanite armoring kit, for reinforcing outerwear."
	icon_state = "blueshield_armor_kit"

	target_armor = /datum/armor/suit_armor/blueshield
	// target_slot = ITEM_SLOT_OCLOTHING
	// change_allowed = TRUE
	// target_allowed = GLOB.security_vest_allowed

	armor_text = "elite Nanotrasen blueshield armored vest"
	target_prefix = "aegis"

/obj/item/armorkit/helmet/blueshield
	name = "aegis headgear kit"
	desc = "An elite Nanotrasen security nanite armoring kit, for reinforcing hats or other headgear."
	icon_state = "blueshield_helmet_kit"

	target_armor = /datum/armor/head_helmet/blueshield
	// target_slot = ITEM_SLOT_HEAD
	// change_allowed = FALSE
	// target_allowed = GLOB.security_vest_allowed

	armor_text = "elite Nanotrasen blueshield helmet"
	target_prefix = "aegis"
