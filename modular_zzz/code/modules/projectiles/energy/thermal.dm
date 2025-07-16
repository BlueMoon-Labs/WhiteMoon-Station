/obj/item/gun/energy/laser/thermal/inferno/emag_act(mob/user, obj/item/card/emag/emag_card)
	. = ..()
	if (obj_flags & EMAGGED)
		return FALSE
	balloon_alert(user, "Взлом прошёл успешно!")
	visible_message(span_warning("От [src] летят искры!"))
	playsound(src, SFX_SPARKS, 50, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	do_sparks(2, TRUE, src)
	obj_flags |= EMAGGED
	ammo_type = /obj/item/ammo_casing/energy/nanite/inferno/emagged
	return TRUE

/obj/item/gun/energy/laser/thermal/cryo/emag_act(mob/user, obj/item/card/emag/emag_card)
	. = ..()
	if (obj_flags & EMAGGED)
		return FALSE
	balloon_alert(user, "Взлом прошёл успешно!")
	visible_message(span_warning("От [src] летят искры!"))
	playsound(src, SFX_SPARKS, 50, TRUE, SHORT_RANGE_SOUND_EXTRARANGE)
	do_sparks(2, TRUE, src)
	obj_flags |= EMAGGED
	ammo_type = /obj/item/ammo_casing/energy/nanite/cryo/emagged
	return TRUE

/obj/item/ammo_casing/energy/nanite/inferno/emagged
	projectile_type = /obj/projectile/energy/inferno/emagged

/obj/item/ammo_casing/energy/nanite/cryo/emagged
	projectile_type = /obj/projectile/energy/cryo/emagged

/obj/projectile/energy/inferno/emagged/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()

	if(isliving(target))
		var/mob/living/living_target = target
		living_target.adjust_wet_stacks(-20)

/obj/projectile/energy/cryo/emagged
	var/temperature = -100

/obj/projectile/energy/cryo/emagged/on_hit(atom/target, blocked = 0, pierce_hit)
	. = ..()

	if(iscarbon(target))
		var/mob/living/carbon/hit_mob = target
		var/thermal_protection = 1 - hit_mob.get_insulation_protection(hit_mob.bodytemperature + temperature)

		// The new body temperature is adjusted by the bullet's effect temperature
		// Reduce the amount of the effect temperature change based on the amount of insulation the mob is wearing
		hit_mob.adjust_bodytemperature((thermal_protection * temperature) + temperature)

	else if(isliving(target))
		var/mob/living/L = target
		// the new body temperature is adjusted by the bullet's effect temperature
		L.adjust_bodytemperature((1 - blocked) * temperature)

	if(isobj(target))
		var/obj/objectification = target

		if(objectification.reagents)
			var/datum/reagents/reagents = objectification.reagents
			reagents?.expose_temperature(temperature)
