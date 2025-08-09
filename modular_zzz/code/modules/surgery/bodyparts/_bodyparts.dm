/obj/item/bodypart/heal_damage(brute, burn, updating_health, forced, required_bodytype)
	if(owner && HAS_TRAIT(owner, TRAIT_NONATURALHEAL) && !forced)
		return
	. = ..()

// /obj/item/stack/medical/heal_carbon(mob/living/carbon/patient, mob/living/user, healed_zone)
// 	if(HAS_TRAIT(patient, TRAIT_NONATURALHEAL))
// 		return FALSE
// 	. = ..()
