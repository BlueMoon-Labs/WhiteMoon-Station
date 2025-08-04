/obj/structure/reagent_dispensers/beerkeg
	name = "Beer Keg"
	desc = "Кега с пивом. Кега выглядит совсем немного вздутой."

/obj/structure/reagent_dispensers/beerkeg/attack_animal(mob/living/simple_animal/user)
	var/explosion_chance = 0
	if(user.combat_mode == INTENT_HARM)
		explosion_chance += 5

	user.visible_message(span_danger("[user] играется с пивной кегой!"),
		span_nicegreen("Ты играешься с пивной кегой!"),
		span_hear("Кто-то катает пивную кегу рядом с вами!"))

	var/turf/push_target = get_step_away(src, user)
	if(push_target && !push_target.density)
		Move(push_target)
		playsound(user, 'sound/items/weapons/thudswoosh.ogg', 100, TRUE, 1)
		do_jitter_animation()
	else
		explosion_chance += 5
		playsound(user, 'sound/items/weapons/thudswoosh.ogg', 100, TRUE, 1)
		do_jitter_animation()

	if(prob(explosion_chance) && isdog(user))
		explosion(src, light_impact_range = 3, flame_range = 5, flash_range = 10)
		playsound(src, 'modular_zzz/sound/misc/kega.ogg', 100, 1)
		if(!QDELETED(src))
			qdel(src)
		return TRUE
	. = ..()

/obj/structure/reagent_dispensers/beerkeg/attack_hand(mob/living/carbon/user)
	. = ..()

	var/explosion_chance = 0
	if(user.combat_mode == INTENT_HARM)
		explosion_chance += 5
	if(ismonkey(user))
		explosion_chance += 5
	if(isdwarf(user)) // ROCK AND STONE!
		explosion_chance = 0
	if(ismammal(user) || iscanine(user) || ismonkey(user))
		explosion_chance += 5

	var/message = ""
	var/self_message = ""
	var/blind_message = span_hear("Кто-то катает пивную кегу рядом с вами!")

	if(!explosion_chance)
		message = span_nicegreen("[user] мастерски играется с пивной кегой!")
		self_message = span_nicegreen("Ты мастерски играешься с пивной кегой!")
	else
		if(user.combat_mode == INTENT_HARM)
			message = span_danger("[user] пинает пивную кегу!")
			self_message = span_danger("Ты пинаешь пивную кегу!")
			blind_message = span_hear("Кто-то пинает пивную кегу рядом с вами!")
		else
			message = span_danger("[user] играется с пивной кегой!")
			self_message = "[span_nicegreen("Ты играешься с пивной кегой!")] [span_warning("Кажется это небезопасно...")]"
	user.visible_message(message, self_message, blind_message)

	var/turf/push_target = get_step_away(src, user)
	if(push_target && !push_target.density)
		Move(push_target)
		playsound(user, 'sound/items/weapons/thudswoosh.ogg', 100, TRUE, 1)
		do_jitter_animation()
	else
		explosion_chance += 10
		playsound(user, 'sound/items/weapons/thudswoosh.ogg', 100, TRUE, 1)
		do_jitter_animation()

	if(prob(explosion_chance))
		explosion(src, light_impact_range = 3, flame_range = 5, flash_range = 10)
		playsound(src, 'modular_zzz/sound/misc/kega.ogg', 100, 1)
		if(!QDELETED(src))
			qdel(src)
		return TRUE

/obj/structure/reagent_dispensers/proc/do_jitter_animation(jitteriness = 10)
	if(anchored)
		return
	var/amplitude = min(4, (jitteriness/100) + 1)
	var/pixel_x_diff = rand(-amplitude, amplitude)
	var/pixel_y_diff = rand(-amplitude/3, amplitude/3)
	var/final_pixel_x = pixel_x
	var/final_pixel_y = pixel_y
	animate(src, pixel_x = pixel_x_diff, pixel_y = pixel_y_diff , time = 2, loop = 6, flags = ANIMATION_PARALLEL | ANIMATION_RELATIVE)
	animate(pixel_x = final_pixel_x , pixel_y = final_pixel_y , time = 2)
	SpinAnimation(0.7, 1)
