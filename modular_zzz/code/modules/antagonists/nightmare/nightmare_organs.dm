/datum/species/shadow/nightmare
	mutanttongue = /obj/item/organ/tongue/nightmare

/obj/item/organ/tongue/nightmare
	// ! ЕМПшечка.
	var/datum/action/cooldown/spell/emp/eldritch/emp_spell

/obj/item/organ/tongue/nightmare/on_mob_insert(mob/living/carbon/brain_owner)
	. = ..()

	emp_spell = new(brain_owner)
	emp_spell.Grant(brain_owner)

/obj/item/organ/tongue/nightmare/on_mob_remove(mob/living/carbon/brain_owner)
	. = ..()
	QDEL_NULL(emp_spell)
