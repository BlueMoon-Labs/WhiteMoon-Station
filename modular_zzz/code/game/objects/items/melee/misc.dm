///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/modkit
	name = "modkit"
	desc = "A modkit for making something into something."
	icon = 'modular_zzplurt/icons/obj/toys/plushes.dmi'
	lefthand_file = 'modular_zzplurt/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_zzplurt/icons/mob/inhands/misc/plushes_right.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "box"
	inhand_icon_state = "box"
	var/product //what it makes
	var/list/fromitem = list() //what it needs

/obj/item/modkit/afterattack(obj/O, mob/user as mob)
	. = ..()

	if(istype(O, product))
		to_chat(user,"<span class='warning'>[O] is already modified!")
		return
	if(O.type in fromitem) //makes sure O is the right thing
		new product(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [O]!","<span class='warning'>You modify the [O]!")
		qdel(O) //Gets rid of the baton
		qdel(src) //gets rid of the kit
	else
		to_chat(user, "<span class='warning'> You can't modify [O] with this kit!</span>")

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/kazeshini_modkit
	name = "Kazeshini Katana Kit"
	desc = "A modkit for making a Sabre into a Kazeshini Katana."
	icon = 'modular_zzplurt/icons/obj/toys/plushes.dmi'
	lefthand_file = 'modular_zzplurt/icons/mob/inhands/misc/plushes_lefthand.dmi'
	righthand_file = 'modular_zzplurt/icons/mob/inhands/misc/plushes_right.dmi'
	w_class = WEIGHT_CLASS_SMALL
	icon_state = "box"
	inhand_icon_state = "box"

/obj/item/kazeshini_modkit/interact_with_atom(atom/interacting_with, mob/living/user, list/modifiers)
	. = ..()

	if(interacting_with.type == /obj/item/storage/belt/sabre) //makes sure O is the right thing
		new /obj/item/storage/belt/sabre/kazeshini(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [interacting_with]!","<span class='warning'>You modify the [interacting_with]!")
		qdel(interacting_with) //Gets rid of the baton
		qdel(src) //gets rid of the kit
	if(interacting_with.type == /obj/item/melee/sabre/luna) //makes sure O is the right thing
		new /obj/item/storage/belt/sabre/kazeshini(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [interacting_with]!","<span class='warning'>You modify the [interacting_with]!")
		qdel(interacting_with) //Gets rid of the baton
		qdel(src) //gets rid of the kit
	if(interacting_with.type == /obj/item/storage/belt/sabre/cargo) //makes sure O is the right thing
		new /obj/item/storage/belt/sabre/cargo/kazeshini(usr.loc) //spawns the product
		user.visible_message("<span class='warning'>[user] modifies [interacting_with]!","<span class='warning'>You modify the [interacting_with]!")
		qdel(interacting_with) //Gets rid of the baton
		qdel(src) //gets rid of the kit
	else
		to_chat(user, "<span class='warning'> You can't modify [interacting_with] with this kit!</span>")

///////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/obj/item/melee/sabre/kazeshini
	name = "Kazeshini Katana"
	desc = "Another artifact in the form of a katana. The blade was found during one expedition group. The blade constantly burns with a blue flame, this flame, as experiments have shown, cannot be extinguished, does not burn to the touch. The blade is forged from an unknown alloy of materials, the blade is not subject to damage and temperature loads."
	icon = 'modular_zzz/icons/obj/weapons/katana.dmi'
	lefthand_file = 'modular_zzz/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_zzz/icons/mob/inhands/weapons/righthand.dmi'
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	pickup_sound = 'sound/items/unsheath.ogg'
	drop_sound = 'modular_zzz/sound/misc/mech-zvonkiy-yarkiy.ogg'
	block_sound = 'sound/items/weapons/block_blade.ogg'

/obj/item/melee/sabre/kazeshini/pickup(mob/living/user)
	. = ..()
	icon_state = "sabre"
	if(user && user.mind)
		user.add_mood_event("badass_antag", /datum/mood_event/badass_antag)

/obj/item/melee/sabre/kazeshini/dropped(mob/living/user)
	if(!(src.item_flags & IN_STORAGE))
		icon_state = "sabre_drop"
	if(user && user.mind)
		user.clear_mood_event("badass_antag")
	. = ..()

/obj/item/melee/sabre/cargo/kazeshini
	name = "Weak Kazeshini Katana"
	desc = "Another artifact in the form of a katana. The blade was found during one expedition group. The blade constantly burns with a blue flame, this flame, as experiments have shown, cannot be extinguished, does not burn to the touch. The blade is forged from an unknown alloy of materials, the blade is not subject to damage and temperature loads."
	icon = 'modular_zzz/icons/obj/weapons/katana.dmi'
	lefthand_file = 'modular_zzz/icons/mob/inhands/weapons/lefthand.dmi'
	righthand_file = 'modular_zzz/icons/mob/inhands/weapons/righthand.dmi'
	hitsound = 'sound/items/weapons/bladeslice.ogg'
	pickup_sound = 'sound/items/unsheath.ogg'
	drop_sound = 'modular_zzz/sound/misc/mech-zvonkiy-yarkiy.ogg'
	block_sound = 'sound/items/weapons/block_blade.ogg'

/obj/item/melee/sabre/cargo/kazeshini/pickup(mob/living/user)
	. = ..()
	icon_state = "sabre"
	if(user && user.mind)
		user.add_mood_event("badass_antag", /datum/mood_event/badass_antag)

/obj/item/melee/sabre/cargo/kazeshini/dropped(mob/living/user)
	if(!(src.item_flags & IN_STORAGE))
		icon_state = "sabre_drop"
	if(user && user.mind)
		user.clear_mood_event("badass_antag")
	. = ..()
