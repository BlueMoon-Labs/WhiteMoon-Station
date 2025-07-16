/obj/item/bodypart/heal_damage(brute, burn, updating_health, forced, required_bodytype)
	if(owner && HAS_TRAIT(owner, TRAIT_NONATURALHEAL) && !forced)
		return
	. = ..()
