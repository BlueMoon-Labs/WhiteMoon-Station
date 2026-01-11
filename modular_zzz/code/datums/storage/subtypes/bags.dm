
///Tray bag
/datum/storage/bag/tray
	// Allow tray to collect food from the kitchen machinery
	var/list/allow_mass_pick_up_from = list(
		/obj/machinery/griddle,
		/obj/item/plate/oven_tray,
		)

/datum/storage/bag/tray/New(atom/parent, max_slots, max_specific_storage, max_total_storage, rustle_sound, remove_rustle_sound)
	. = ..()
	allow_mass_pick_up_from = typecacheof(allow_mass_pick_up_from)

/datum/storage/bag/tray/on_preattack(datum/source, obj/item/thing, mob/user, list/modifiers)

	if(!istype(thing) || thing == parent.loc || !allow_quick_gather || thing.atom_storage || !thing.loc)
		return ..()

	if(collection_mode == COLLECT_ONE)
		return ..()

	if(!is_type_in_typecache(thing.loc.type, allow_mass_pick_up_from))
		return ..()

	INVOKE_ASYNC(src, PROC_REF(collect_on_turf), thing, user)
	return COMPONENT_CANCEL_ATTACK_CHAIN
