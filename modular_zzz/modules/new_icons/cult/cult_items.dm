/obj/item/station_curse
	name = "Проклятая Сфера"
	desc = "Эта сфера хранит в себе первородное зло и, наверное, это недопустимо ронять или даже ломать..."
	icon = 'modular_zzz/icons/obj/antags/cult/cult.dmi'
	icon_state ="shuttlecurse"
	var/static/curselimit = 0

/obj/item/station_curse/attack_self(mob/living/user)
	if(!IS_CULTIST(user))
		user.dropItemToGround(src, TRUE)
		user.Paralyze(100)
		to_chat(user, span_warning("Мощная сила отталкивает вас от [src]!"))
		return
	if(curselimit >= 3)
		to_chat(user, "<span class='notice'>Мы исчерпали свою способность проклинать Космическую Станцию.</span>")
		return
	if(locate(/obj/narsie) in SSpoints_of_interest.narsies)
		to_chat(user, "<span class='warning'>Nar'Sie is already on this plane, there is no delaying the end of all things.</span>")
		return

	to_chat(user, "<span class='danger'>Вы разбиваете сферу! Темная сущность поднимается в воздух, затем исчезает.</span>")
	playsound(user.loc, 'sound/effects/glass/glassbr1.ogg', 50, 1)
	qdel(src)
	sleep(pick(50, 100, 150, 200, 250))
	var/datum/round_event_control/portal_storm_narsie/portal_storm_narsie = new/datum/round_event_control/portal_storm_narsie
	portal_storm_narsie.run_event()
	curselimit++

/obj/item/cult_shift
	icon = 'modular_zzz/icons/obj/antags/cult/cult.dmi'

/obj/item/sharpener/cult
	icon = 'modular_zzz/icons/obj/antags/cult/cult.dmi'

/obj/item/shuttle_curse
	icon = 'modular_zzz/icons/obj/antags/cult/cult.dmi'

/obj/item/clothing/glasses/hud/health/night/cultblind
	invis_override = SEE_INVISIBLE_HIDDEN_RUNES

/mob/living/basic/construct
	see_invisible = SEE_INVISIBLE_HIDDEN_RUNES
