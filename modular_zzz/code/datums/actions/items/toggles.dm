/datum/action/item_action/no_drop_toggle
	name = "No Drop"
	desc = "Предмет не выпадет из рук!"
	button_icon = 'icons/obj/weapons/hand.dmi'
	button_icon_state = "disintegrate"

/datum/action/item_action/no_drop_toggle/do_effect(trigger_flags)
	. = ..()
	if(!. || !isitem(target) || !ismob(usr))
		return FALSE
	var/obj/item/I = target
	var/mob/M = usr
	if(!M.is_holding(I))
		return FALSE
	if(HAS_TRAIT_FROM(I, TRAIT_NODROP, REF(src)))
		REMOVE_TRAIT(I, TRAIT_NODROP, REF(src))
		to_chat(M, "Ты расжимаешь хватку.")
	else
		ADD_TRAIT(I, TRAIT_NODROP, REF(src))
		to_chat(M, "Ты цепляешься к предмету смертной хваткой!")
		M.playsound_local(M, 'sound/items/equip/glove_equip.ogg', 100, FALSE)
	build_all_button_icons()

/datum/action/item_action/no_drop_toggle/apply_button_background(atom/movable/screen/movable/action_button/current_button, force)
	if(!isnull(target) && HAS_TRAIT_FROM(target, TRAIT_NODROP, REF(src)))
		background_icon_state = "bg_default_on"
	else
		background_icon_state = "bg_default"
	. = ..()
