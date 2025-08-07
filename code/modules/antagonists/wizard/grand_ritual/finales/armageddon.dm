#define DOOM_SINGULARITY "singularity"
#define DOOM_TESLA "tesla"
#define DOOM_METEORS "meteors"

/// Kill yourself and probably a bunch of other people
/datum/grand_finale/armageddon
	name = "Annihilation"
	desc = "This crew have offended you beyond the realm of pranks. Make the ultimate sacrifice to teach them a lesson your elders can really respect. \
		YOU WILL NOT SURVIVE THIS."
	icon = 'icons/mob/simple/lavaland/lavaland_monsters.dmi'
	icon_state = "legion_head"
	minimum_time = 90 MINUTES // This will probably immediately end the round if it gets finished.
	ritual_invoke_time = 60 SECONDS // Really give the crew some time to interfere with this one.
	dire_warning = TRUE
	glow_colour = "#be000048"
	/// Things to yell before you die
	var/static/list/possible_last_words = list(
		"Пламя и руины!",
		"Смеееееееееееееееерть!!",
		"Погиииииииииииииибель!!",
		"Дууууууууууууууууууум!!",
		"АХАХАХАХА!! УХАХАХАХА!!",
		"Хи-хи-хи!! Ууууууууу!! Ха-ха-хааа!!",
		"Хохохохохохо!!",
		"Содрогнитесь от страха, жалкие смертные!",
		"Трепещите перед моей славой!",
		"Я твой новый Бог! Молись!!!",
		"Это бесполезно!",
		"Если бы боги хотели, чтобы ты жил, они бы не создали меня!",
		"Бог остается на небесах из-за страха перед тем, что я создал!",
		"Разрушение пришло!",
		"Всё сотворённое, подчинись моей воле!",
	)

/datum/grand_finale/armageddon/trigger(mob/living/carbon/human/invoker)
	priority_announce(pick(possible_last_words), null, 'sound/effects/magic/voidblink.ogg', sender_override = "[invoker.real_name]", color_override = "purple")
	var/turf/current_location = get_turf(invoker)
	invoker.gib(DROP_ALL_REMAINS)

	var/static/list/doom_options = list()
	if (!length(doom_options))
		doom_options = list(DOOM_SINGULARITY, DOOM_TESLA)
		if (!SSmapping.is_planetary())
			doom_options += DOOM_METEORS

	switch(pick(doom_options))
		if (DOOM_SINGULARITY)
			var/obj/singularity/singulo = new(current_location)
			singulo.energy = 300
		if (DOOM_TESLA)
			var/obj/energy_ball/tesla = new (current_location)
			tesla.energy = 200
		if (DOOM_METEORS)
			GLOB.meteor_mode ||= new()
			GLOB.meteor_mode.meteordelay = 0
			GLOB.meteor_mode.start_meteor()
			priority_announce("На траектории столкновения со станцией были обнаружены метеоры.", "ВНИМАНИЕ: МЕТЕОРЫ", ANNOUNCER_METEORS)

#undef DOOM_SINGULARITY
#undef DOOM_TESLA
#undef DOOM_METEORS
