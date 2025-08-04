/datum/round_event/radiation_storm/announce(fake)
	priority_announce(
		text = "Вблизи станции обнаружен высокий уровень радиации. Немедленно покиньте рабочие места и найдите укрытие.",
		title = "ВНИМАНИЕ: РАДИАЦИЯ",
		sound = ANNOUNCER_RADIATION,
	)
	// we trigger the airlocks for a bit to not immediately give away that it's fake
	if(fake && !GLOB.emergency_access)
		make_maint_all_access(silent = TRUE)
		addtimer(CALLBACK(GLOBAL_PROC, GLOBAL_PROC_REF(revoke_maint_all_access), FALSE), 90 SECONDS)
