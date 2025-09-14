/**
 * Данный антаг был вдоховлен игрою "Hatred" (2015).
 *
 * Краткое пояснение концепта антага и игромеханических решений:
 * 		Концепт: мажорный мидраунд антаг для хард динамика с целью моментального массового ПВП пиздореза. Почти как Lone Operative, но этот не должен
 * просто закончить раунд, убив капитана. Минимум манча и времени на разогрев. Только при существенном онлайне и с достаточным количеством живых офицеров СБ.
 * 		Хил от убийства других игроков: как и в оригинальной игре персонаж восстанавливает здоровье от кинематографичных убийств (glory kills) и это является
 * единственным способом востановить здоровье. Я полагаю и в сске оно будет выглядеть уместно и вполне сбалансированно. Игроку для восстановления
 * здоровья необходимо заставить живую цель не двигаться вплоть до ~10 секунд и убить её выстрелом вплотную для восстановления здоровья. Тем самым мы снижаем
 * градус ахуевания антага и заставляем его делать передышики и играть аккуратнее, ведь он один, всегда уязвим и не может прятаться в космосе или вне станции,
 * как делает абсолютное большинство антагов.
 * 		Оружие с бесконечными патронами: в оригинальной игре по локации разбросана куча других оружий, а также оружие щедро падает с бесконечных волн
 * полицейских. Но в сске у нас ограниченное количество СБ, поэтому рано или поздно антаг пойдет манчить себе оружие. Этот антаг создан для пиздореза,
 * а не получасового манча оружейки, поэтому я хочу свести к минимуму любой существенный манч.
 * 		"Прикрученное намертво" снаряжение: всё минимально необходимое снаряжение намертво прикручено к персонажу. Оно хорошо сбалансированно
 * для ведения продолжительных пвп битв, но не является читами и накладывает массу ограничений, поэтому при возможности игрок скинул бы свое снаряжение и
 * взял бы что-то более мощное, убийственное или полезное, например МОДсьюты или хардсьюты ЕРТшников, но я ему не позволю, ибо как сказано в предыдущем
 * пункте: это антаг не для манча, а для моментального пиздореза.
 *
 * Если будет востребованно, то я возможно сделаю:
 * 		- Антаг худ (квадратик над персонажем с иконкой роли)
 * 		- Счетчик убийств и вывод его в итоги раунда (здесь мне нужна помощь, я не знаю, как считать сочные фраги).
 * 			- минимум убийств для получения гринтекста.
 * 			- события после определенного кол-ва убийств (если перебил пол станции)..
 * 		- Больше QOL фич, если у меня или других игроков будут хорошие и выполнимые идеи.
 */

//////////////////////////////////////////////
//                                          //
//            	 ANTAG BASE		            //
//                                          //
//////////////////////////////////////////////

/datum/antagonist/hatred
	name = "\improper Mass Shooter"
	antagpanel_category = "Mass Shooter"
	roundend_category = "Mass Shooter"
	pref_flag = ROLE_MASS_SHOOTER
	antag_moodlet = /datum/mood_event/focused
	suicide_cry = "I REGRET NOTHING."
	show_to_ghosts = TRUE
	show_in_antagpanel = FALSE // only for ghosts
	antag_ticket_multiplier = 1
	var/list/allowed_z_levels = list()
	/**
	 * Level of available gear is determined by a number of alive security officers and other conditions.
	 * 0 = low guns NOT IMPLEMENTED YET!
	 * 1 = default classic and serious guns
	 * 2 = high gear
	 */
	var/gear_level = 1
	// var/list/low_guns = list("Pistol", "Double-barreled shotgun") // NOT IMPLEMENTED YET!
	var/list/classic_guns = list("AK12", "Riot Shotgun", "Pistols")
	// there won't be special level 2 guns, because I don't want antag to have cheat guns. Level 2 gear is always better stats/traits for level 1 gear.
	var/list/high_gear = list(/*"Belt of Hatred", */"More armor", "Faster executions")
	var/chosen_gun = null
	var/chosen_high_gear = null
	var/next_speech_time = 0
	var/list/killing_speech = list(	'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_1.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_2.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_3.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_4.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_5.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_6.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_7.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_8.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_9.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_10.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_11.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_12.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_13.ogg',
									'modular_zzz/code/modules/antagonists/hatred/killing_speech/hatred_speech_14.ogg'
									)
	var/list/allowed_guns = list(	/obj/item/gun/ballistic/automatic/ar/ak12/hatred,
									/obj/item/gun/ballistic/shotgun/riot/hatred,
									/obj/item/gun/ballistic/automatic/pistol/m1911/hatred,
									/obj/item/gun/ballistic/shotgun/doublebarrel/hatred_sawn_off
									)

/datum/job/hatred
	title = ROLE_MASS_SHOOTER

/datum/antagonist/hatred/get_preview_icon()
	return finish_preview_icon(icon('modular_zzz/code/modules/antagonists/hatred/hatred_icon.dmi', "human"))

/datum/antagonist/hatred/greet()
	var/greet_text
	greet_text += "Ты - [span_red(span_bold("Безымянный Массшутер"))]. Твое имя совершенно неважно. Твое прошлое даже если и было, оно было незавидным.<br>"
	greet_text += "Ты испытываешь непреодолимую ненависть, отвращение и презрение ко всем окружающим.<br>"
	greet_text += "У тебя лишь две цели: <u>убивать</u> и <u>умереть славной смертью</u>.<br>"
	greet_text += "Твое проклятое снаряжение неразлучно с тобою и подстегивает тебя продолжать соврешать геноцид беззащитных гражданских.<br>"
	greet_text += "Твоё [span_red("Оружие Ненависти")] и неутолимая жажда убивать вознаграждают тебя, ибо завершающий выстрел в упор в голову (рот) исцеляет твои раны, нож добивает быстрее. [span_red("Обычная медицина бессильна")].<br>"
	if(chosen_gun == "Pistols")
		greet_text += "[span_red("Кобура Ненависти")] всегда готова предоставить тебе особое парное оружие (стрелять с двух рук - в харме). После использования можешь просто выбросить их, ибо их цель была выполнена.<br>"
	else
		greet_text += "[span_red("Cумка для патронов")] сама пополняет пустые магазины/картриджи/клипсы. Никогда не выбрасывай их!<br>"
	if(chosen_gun == "Riot Shotgun")
		greet_text += "В твоей кобуре спрятан [span_red("запасной дробовик")], чтобы у тебя всегда под рукой был План Б.<br>"
	// if(chosen_high_gear == "Belt of Hatred")
	if(!isnull(chosen_high_gear))
		greet_text += "[span_red("Пояс с гранатами")] пожирает сердца твоих жертв после их добивания и вознаграждает тебя новой взрывоопасной аммуницией.<br>"
	greet_text += "[span_red(span_bold("Убивай и будь убит!"))] Ибо никто сегодня не защищен от твоей Ненависти.<br>"
	to_chat(owner.current, greet_text)
	owner.announce_objectives()

/datum/antagonist/hatred/on_gain()
	var/mob/living/carbon/human/H = owner.current
	if(!istype(H))
		return
	make_authentic_body()
	evaluate_security()
	forge_objectives()
	H.Immobilize(INFINITY, TRUE) // we don't want the player to walk around in temorary debug room during equipment selection.
	// H.Paralyze(INFINITY, TRUE)
	H.equipOutfit(/datum/outfit/hatred)
	// H.SetParalyzed(0, TRUE)
	. = ..()
	// SPECIAL TRAITS
	ADD_TRAIT(H, TRAIT_SLEEPIMMUNE, "hatred") // I challenge you to a glorious fight!
	ADD_TRAIT(H, TRAIT_VIRUS_RESISTANCE, "hatred")
	ADD_TRAIT(H, TRAIT_NONATURALHEAL, "hatred") // for heal_damage()
	ADD_TRAIT(H, TRAIT_FEARLESS, "hatred")
	ADD_TRAIT(H, TRAIT_STRONG_GRABBER, "hatred") // This way player will have less problems with his targets run/crawl away during glory kills
	ADD_TRAIT(H, TRAIT_QUICKER_CARRY, "hatred")
	ADD_TRAIT(H, TRAIT_DRINKS_BLOOD, "hatred") // why not
	ADD_TRAIT(H, TRAIT_NODISMEMBER, "hatred") // if a player loses his arm, he won't be able to shoot nor drop his gun. it would be unplayable.
	ADD_TRAIT(H, TRAIT_UNCONVERTABLE, "hatred")
	// ADD_TRAIT(H, TRAIT_NOSOFTCRIT, "hatred")
	H.add_movespeed_mod_immunities("hatred", /datum/movespeed_modifier/damage_slowdown) // I want him to be a bit slower, but indomitable by mere pain.
	H.add_movespeed_modifier(/datum/movespeed_modifier/hatred)
	//  GENERAL QUIRKS
	H.add_quirk(/datum/quirk/night_vision, announce = FALSE) // ADD_TRAIT(H, TRAIT_NIGHT_VISION, "hatred")
	ADD_TRAIT(H, TRAIT_EVIL, "hatred") // H.add_quirk(/datum/quirk/evil, announce = FALSE) // no unwanted post_add() text
	H.add_quirk(/datum/quirk/throwingarm, announce = FALSE) // ADD_TRAIT(H, TRAIT_THROWINGARM, "hatred")
	// H.add_quirk(/datum/quirk/jumper, announce = FALSE) // ADD_TRAIT(H, TRAIT_JUMPER, "hatred")
	H.add_quirk(/datum/quirk/tough, announce = FALSE) // ADD_TRAIT(H, TRAIT_TOUGH, "hatred")
	H.add_quirk(/datum/quirk/freerunning, announce = FALSE) // ADD_TRAIT(H, TRAIT_FREERUNNING, "hatred")
	H.add_quirk(/datum/quirk/monochromatic, announce = FALSE)
	tgui_alert(H, "У тебя есть последняя минута, чтобы собраться с мыслями. Закрой это окошко когда будешь готов...", "Ты готов убивать?", list("Я готов убивать."), timeout = 1 MINUTES, autofocus = FALSE)
	// WE ARE READY.
	H.SetImmobilized(0, TRUE)
	H.fully_heal() // in case of some accidents in spawn room during preparation
	appear_on_station()
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_CENTCOM)
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_RESERVED)
	allowed_z_levels += SSmapping.levels_by_trait(ZTRAIT_STATION)
	RegisterSignal(H, COMSIG_MOVABLE_Z_CHANGED, PROC_REF(check_hatred_off_station)) // almost like anchor implant, but doesn't hurt
	RegisterSignals(H, COMSIG_LIVING_ADJUST_STANDARD_DAMAGE_TYPES, PROC_REF(on_try_healing)) // for AdjustXXXLoss()
	RegisterSignal(H, COMSIG_MOB_EQUIPPED_ITEM, PROC_REF(check_knife)) // any knife we pick might be our deadliest weapon
	RegisterSignal(H, COMSIG_MOB_TRYING_TO_FIRE_GUN, PROC_REF(check_used_gun))
	playsound(H, pick('modular_zzz/code/modules/antagonists/hatred/hatred_begin_1.ogg', \
						'modular_zzz/code/modules/antagonists/hatred/hatred_begin_2.ogg', \
						'modular_zzz/code/modules/antagonists/hatred/hatred_begin_3.ogg'), vol = 50, vary = FALSE, ignore_walls = FALSE)
	addtimer(CALLBACK(src, PROC_REF(alarm_station)), 10 SECONDS, TIMER_DELETE_ME) // Think FAST.

/datum/movespeed_modifier/hatred
	multiplicative_slowdown = 0.5

/datum/antagonist/hatred/proc/evaluate_security()
	var/gear_points = length(SSjob.get_living_sec())
	// for(var/datum/mind/blu as anything in get_crewmember_minds())
	// 	if(!(blu.assigned_role in list("Blueshield")))
	// 		continue
	// 	if(isnull(blu.current) || blu.current.stat == DEAD)
	// 		continue
	// 	gear_points++
	if(SSsecurity_level.get_current_level_as_number() == SEC_LEVEL_GREEN) // (GC) - у станции нет проблем и все внимание СБ будет приковано к антагу
		gear_points++
	if(length(active_ais(check_mind = TRUE, skip_syndicate = TRUE))) // вертолеты
		gear_points++
	switch(gear_points)
		// if(-INFINITY to 4)
		// 	gear_level = 0
		if(-INFINITY to 5) 	// 4(GC)-5
			gear_level = 1
		if(7 to INFINITY) 	// 7+
			gear_level = 2

/datum/antagonist/hatred/proc/make_authentic_body()
	var/mob/living/carbon/human/H = owner.current
	H.real_name = "The Man without a name"
	H.name = H.real_name
	H.dna.real_name = H.real_name
	H.mind?.name = H.real_name
	H.set_species(/datum/species/human)
	H.set_gender(MALE, TRUE, forced = TRUE)
	H.physique = MALE
	H.dna.remove_all_mutations()
	H.skin_tone = "albino"
	H.set_hairstyle("Curtains", update = FALSE)
	H.set_haircolor(sanitize_hexcolor("#000000"), update = FALSE)
	H.set_facial_hairstyle("Shaved", update = FALSE)
	H.set_facial_haircolor(sanitize_hexcolor("#000000"), update = FALSE)
	H.set_blooper("growl2")
	H.blooper_speed = 8
	H.blooper_pitch = 0.6
	H.blooper_pitch_range = 0.3
	H.dna.update_ui_block(/datum/dna_block/identity/gender)
	H.dna.update_ui_block(/datum/dna_block/identity/skin_tone)
	H.dna.update_ui_block(/datum/dna_block/identity/hair_style)
	H.dna.update_ui_block(/datum/dna_block/identity/hair_color)
	H.dna.update_ui_block(/datum/dna_block/identity/facial_style)
	H.dna.update_ui_block(/datum/dna_block/identity/facial_color)
	H.update_body(TRUE)
	H.update_hair()

/datum/antagonist/hatred/forge_objectives()
	var/datum/objective/O = new /datum/objective/genocide()
	O.owner = owner
	objectives += O
	O = new /datum/objective/martyr()
	O.owner = owner
	objectives += O

/datum/objective/genocide
	name = "Genocide of civilians"
	explanation_text = "Убей столько народу, сколько успеешь за свою короткую оставшуюся жизнь. Не щади никого. Кровь слабых питает тебя."
	martyr_compatible = TRUE
	completed = TRUE // i have no idea how to count your personal kills.

/datum/antagonist/hatred/proc/appear_on_station()
	var/list/possible_spawns = list()
	possible_spawns += get_safe_random_station_turf(typesof(/area/station/command/gateway)) // 1/7 is ~15%
	// possible_spawns += get_safe_random_station_turf(typesof(/area/station/cargo)) // for debug at Runtime Station
	for(var/i = 1; i <= 6; i++) // to increase chances for antag to spawn in maints.
		possible_spawns += find_maintenance_spawn(atmos_sensitive = TRUE)
	list_clear_nulls((possible_spawns))
	var/turf/chosen_spawn = length(possible_spawns) ? pick(possible_spawns) : find_safe_turf(extended_safety_checks = TRUE, dense_atoms = FALSE) // in case of some huge map problems
	owner.current.forceMove(chosen_spawn)
	do_sparks(4, TRUE, owner.current)

/datum/antagonist/hatred/proc/check_hatred_off_station()
	SIGNAL_HANDLER
	var/turf/my_location = get_turf(owner.current)
	if(!(my_location.z in allowed_z_levels))
		to_chat(owner.current, span_userdanger("Так просто они от меня не избавятся..."))
		appear_on_station()

/datum/antagonist/hatred/proc/on_try_healing(mob/current_mob, type, amount, forced)
	SIGNAL_HANDLER
	if((type != OXY) && (amount < 0) && !forced)
		return COMPONENT_IGNORE_CHANGE
	return NONE

/datum/antagonist/hatred/proc/alarm_station() // major antag is currently commencing genocide, so we must let everyone know.
	if(istype(src) && owner?.current)
		var/chosen_sound = pick('modular_zzz/code/modules/antagonists/hatred/hatred_spawned_1.ogg','modular_zzz/code/modules/antagonists/hatred/hatred_spawned_2.ogg')
		priority_announce("На ваш объект ворвался особо опасный вооруженный преступник с целью массового убийства гражданских лиц. \
							Нейтрализуйте угрозу любыми доступными средствами. \
							ЦК санкционирует всему персоналу станции против данной цели: использование летального вооружения, открытие огня без предупреждения и казнь на месте. \
							\n\nОсобые приметы: мужчина спортивного телосложения в длинном черном кожаном пальто с длинными черными волосами и [chosen_gun].", \
							"ALERT: MASS SHOOTER!", chosen_sound, has_important_message = TRUE)

/// we check if we picked up a knife in our hand. if so, we listen to it when it strikes its target.
/datum/antagonist/hatred/proc/check_knife(mob/source, obj/item/I, slot)
	SIGNAL_HANDLER
	if(istype(I, /obj/item/knife) && slot == ITEM_SLOT_HANDS && ishuman(source))
		RegisterSignal(I, COMSIG_ITEM_ATTACK, PROC_REF(knife_check_glory))
		RegisterSignal(I, COMSIG_ITEM_DROPPED, PROC_REF(remove_knife_check_glory))

/// once we don't hold a knife, we don't listen to it when it strikes.
/datum/antagonist/hatred/proc/remove_knife_check_glory(obj/item/knife/K, mob/user)
	SIGNAL_HANDLER
	UnregisterSignal(K, COMSIG_ITEM_ATTACK)
	UnregisterSignal(K, COMSIG_ITEM_DROPPED)

/// if we strike a target and it meets certain criteria - we handle it in a special way.
/datum/antagonist/hatred/proc/knife_check_glory(obj/item/knife/K, mob/living/target_mob, mob/user, list/modifiers, list/attack_modifiers)
	SIGNAL_HANDLER
	if(ishuman(target_mob) && ishuman(user) && target_mob != user)
		if(length(attack_modifiers) && attack_modifiers[FORCE_OVERRIDE] == 200) // no need to check. the lethal strike is about to be blown.
			return
		var/mob/living/carbon/human/target = target_mob
		var/mob/living/carbon/human/killer = user
		// the target is dead and we want its heart for the Belt of Hatred.
		if(target.stat == DEAD && killer.zone_selected == BODY_ZONE_CHEST && target.get_bodypart(BODY_ZONE_CHEST))
			var/datum/wound/loss/dismembering = new
			dismembering.apply_dismember(target.get_bodypart(BODY_ZONE_CHEST), outright = TRUE)
		// the target is almost dead and we want to glory kill it with a knife.
		else if(!(target.stat in list(CONSCIOUS)) && killer.zone_selected == BODY_ZONE_PRECISE_MOUTH && !isdullahan(target) && target.get_bodypart(BODY_ZONE_HEAD))
			target.visible_message(span_warning("[killer] brings [K] to [target]'s throat, ready to slit it open..."), \
									span_userdanger("[killer] brings [K] to your throat, ready to slit it open..."))
			// it's a signal handler so we don't sleep
			INVOKE_ASYNC(src, PROC_REF(knife_glory_kill), target, K, killer, modifiers, attack_modifiers)
			return COMPONENT_CANCEL_ATTACK_CHAIN

/// target is in crit and about to be executed.
/datum/antagonist/hatred/proc/knife_glory_kill(mob/living/carbon/human/target, obj/item/knife/knife, mob/living/carbon/human/killer, list/modifiers, list/attack_modifiers)
	var/is_glory = TRUE
	// already dead bodies or npcs don't count
	// if((!target.client && ((world.time - target.lastclienttime) > 10 SECONDS)) || (target.stat == DEAD && ((world.time - target.timeofdeath) > 3 SECONDS)))
	if(!target.client || target.stat == DEAD)
		is_glory = FALSE
	else if(next_speech_time <= world.time)
		playsound(owner.current, pick(killing_speech), vol = 50, vary = FALSE, ignore_walls = FALSE)
		next_speech_time = world.time + 10 SECONDS
	var/time_to_kill = chosen_high_gear == "Faster executions" ? 4 SECONDS : 6 SECONDS
	if(do_after(killer, time_to_kill, target))
		target.visible_message(span_warning("[killer] slits [target]'s throat!"), span_userdanger("[killer] slits your throat!"))
		SET_ATTACK_FORCE(attack_modifiers, 200)
		// knife.attack(target, killer, modifiers, attack_modifiers)
		knife.melee_attack_chain(killer, target, modifiers, attack_modifiers)
		while(target.stat != DEAD && killer.CanReach(target, knife))
			if(!do_after(killer, 0.5 SECONDS, target))
				break
			if(!knife.melee_attack_chain(killer, target, modifiers, attack_modifiers))
				break
		if(is_glory)
			addtimer(CALLBACK(knife, TYPE_PROC_REF(/obj/item/knife, check_glory_kill), killer, target), 1 SECONDS, TIMER_DELETE_ME)
	else
		target.visible_message(span_notice("[killer] stopped his knife."), span_notice("[killer] stopped his knife!"))

/datum/antagonist/hatred/proc/check_used_gun(mob/living/carbon/human/H, obj/item/gun/G, target, flag, params)
	SIGNAL_HANDLER
	if(is_type_in_list(G, allowed_guns))
		return
	else
		to_chat(H, span_userdanger("You have no need for this. You have your own killing machines."))
		return COMPONENT_CANCEL_GUN_FIRE

/datum/antagonist/hatred/on_removal()
	var/mob/living/L = owner.current
	UnregisterSignal(L, COMSIG_MOVABLE_Z_CHANGED)
	UnregisterSignal(L, COMSIG_LIVING_ADJUST_STANDARD_DAMAGE_TYPES)
	UnregisterSignal(L, COMSIG_MOB_EQUIPPED_ITEM)
	UnregisterSignal(L, COMSIG_MOB_TRYING_TO_FIRE_GUN)
	. = ..()
	if(!QDELETED(L) && istype(L))
		ADD_TRAIT(L, TRAIT_PREVENT_IMPLANT_AUTO_EXPLOSION, "hatred") // no boom on admin remove
		to_chat(L, span_userdanger("As Hatred leaves your mind, it consumes you completely..."))
		L.dust(force = TRUE) // from ghosts we come, to ghosts we leave.

/obj/item/gun/handle_suicide(mob/living/carbon/human/user, mob/living/carbon/human/target, params, bypass_timer, time_to_kill = 12 SECONDS)
	var/datum/antagonist/hatred/Ha = user.mind.has_antag_datum(/datum/antagonist/hatred)
	if(!Ha || !ishuman(target))
		return ..()
	if(!target.get_bodypart(BODY_ZONE_HEAD))
		return
	var/is_glory = TRUE
	// already dead bodies or npcs don't count
	// if((!target.client && ((world.time - target.lastclienttime) > 10 SECONDS)) || (target.stat == DEAD && ((world.time - target.timeofdeath) > 3 SECONDS)))
	if(!target.client || target.stat == DEAD)
		is_glory = FALSE
	else if(Ha.next_speech_time <= world.time)
		playsound(user, pick(Ha.killing_speech), vol = 50, vary = FALSE, ignore_walls = FALSE)
		Ha.next_speech_time = world.time + 10 SECONDS
	var/new_ttk = Ha.chosen_high_gear == "Faster executions" ? 6 SECONDS : 8 SECONDS
	. = ..(user, target, params, bypass_timer, time_to_kill = new_ttk)
	if(!. || user == target || !is_glory)
		return
	addtimer(CALLBACK(src, PROC_REF(check_glory_kill), user, target), 1 SECONDS, TIMER_DELETE_ME) // wait for boolet to do its job

/obj/item/proc/check_glory_kill(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if((QDELETED(target) || target?.stat == DEAD) && !QDELETED(user) && (user?.stat in list(CONSCIOUS, SOFT_CRIT)))
		user.fully_heal() // the only way of healing
		// user.do_adrenaline(150, TRUE, 0, 0, TRUE, list(/datum/reagent/medicine/inaprovaline = 10, /datum/reagent/medicine/synaptizine = 15, /datum/reagent/medicine/regen_jelly = 20, /datum/reagent/medicine/stimulants = 20), "<span class='boldnotice'>You feel a sudden surge of energy!</span>")
		user.visible_message("As victim's blood splashes onto [src], it starts glowing menacingly and its wielder seemingly regaining his strength and vitality.")
		to_chat(user, span_notice("The blood of the weak gives you an inhuman relief and strength to continue the massacre."))
		var/obj/item/storage/belt/military/assault/hatred/B = user.get_item_by_slot(ITEM_SLOT_BELT)
		if(istype(B))
			to_chat(user, span_notice("[B.name] hungrily growls in anticipation of the coming sacrifice."))
			B.glory_points++

//////////////////////////////////////////////
//                                          //
//                	 GEAR		            //
//                                          //
//////////////////////////////////////////////

/// THE GUN OF HATRED ///

// we don't have ak47. what a disappointment. wake me up when we have one.
/obj/item/gun/ballistic/automatic/ar/ak12/hatred
	name = "\proper AK-12 rifle of Hatred"
	desc = "The scratches on this rifle say: \"The Genocide Machine\"."
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_integrity = 400 // will be damaged during antag's death implant detonation
	burst_fire_selection = FALSE
	actions_types = null
	burst_size = 1
	burst_delay = 2
	weapon_weight = WEAPON_HEAVY
	// 100% = 35
	// 90% = 32
	// 85% = 30
	// 80% = 28
	projectile_damage_multiplier = 0.8
	var/mob/living/carbon/human/original_owner = null
	var/is_trophy = FALSE

/obj/item/gun/ballistic/automatic/ar/ak12/hatred/Initialize(mapload)
	. = ..()
	AddComponent(/datum/component/automatic_fire, 0.2 SECONDS)

/obj/item/gun/ballistic/automatic/ar/ak12/hatred/examine(mob/user)
	. = ..()
	if(HAS_TRAIT(src, TRAIT_NODROP))
		. += span_danger("You cannot make your fingers drop this weapon of Doom.")

/obj/item/gun/ballistic/automatic/ar/ak12/hatred/equipped(mob/living/user, slot)
	. = ..()
	if(!is_trophy)
		if(isnull(original_owner))
			original_owner = user
			RegisterSignal(original_owner, COMSIG_LIVING_DEATH, PROC_REF(on_hatred_death))
		if(original_owner == user)
			ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/gun/ballistic/automatic/ar/ak12/hatred/proc/on_hatred_death()
	SIGNAL_HANDLER
	desc = "The blood stained scratches on this rifle say: \"The Genocide Machine\"."
	is_trophy = TRUE
	REMOVE_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/gun/ballistic/automatic/ar/ak12/hatred/dropped(mob/user, silent)
	. = ..()
	if(!is_trophy)
		if(user == original_owner) // lost arm or something else
			REMOVE_TRAIT(src, TRAIT_NODROP, "hatred")

/// THE SHOTGUN OF HATRED ///

/obj/item/gun/ballistic/shotgun/riot/hatred
	name = "\proper Riot Shotgun of Hatred"
	desc = "The scratches on this shotgun say: \"The Bringer of Doom\"."
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/hatred
	resistance_flags = FIRE_PROOF | ACID_PROOF
	max_integrity = 400 // will be damaged during antag's death implant detonation
	box_reload_penalty = FALSE
	fire_delay = 4
	rack_delay = 4
	var/mob/living/carbon/human/original_owner = null
	var/quick_empty_flag = FALSE // is user quick emptying it right now
	var/is_trophy = FALSE

/obj/item/ammo_box/magazine/internal/shot/hatred
	ammo_type = /obj/item/ammo_box/advanced/s12gauge
	max_ammo = 6 // there are 7 shells in default ammo boxes, so shotgun has perfect 6+1 slots.

/obj/item/gun/ballistic/shotgun/riot/hatred/give_manufacturer_examine()
	return // no more "Nanotrasen Armories"

/obj/item/gun/ballistic/shotgun/riot/hatred/examine(mob/user)
	. = ..()
	. += span_notice("[span_bold("Ctrl-Shift-Click")] to quickly empty [src].")
	if(HAS_TRAIT(src, TRAIT_NODROP))
		. += span_danger("You cannot make your fingers drop this weapon of Doom.")

// говно с оффов не обрабатывает обновление счетчика патронов при перезарядке
/obj/item/gun/ballistic/shotgun/riot/hatred/load_gun(obj/item/ammo, mob/living/user)
	. = ..()
	SEND_SIGNAL(src, COMSIG_UPDATE_AMMO_HUD)

/obj/item/gun/ballistic/shotgun/riot/hatred/click_ctrl_shift(mob/user)
	if(!quick_empty_flag)
		quick_empty_flag = TRUE
		rack()
		while(chambered)
			stoplag(3)
			rack()
		quick_empty_flag = FALSE

/obj/item/gun/ballistic/shotgun/riot/hatred/equipped(mob/living/user, slot)
	. = ..()
	if(!is_trophy)
		if(isnull(original_owner))
			original_owner = user
			RegisterSignal(original_owner, COMSIG_LIVING_DEATH, PROC_REF(on_hatred_death))
		if(original_owner == user)
			ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/gun/ballistic/shotgun/riot/hatred/proc/on_hatred_death()
	SIGNAL_HANDLER
	desc = "The blood stained scratches on this shotgun say: \"The Bringer of Doom\"."
	is_trophy = TRUE
	REMOVE_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/gun/ballistic/shotgun/riot/hatred/dropped(mob/user, silent)
	. = ..()
	if(!is_trophy)
		if(user == original_owner) // lost arm or something else
			REMOVE_TRAIT(src, TRAIT_NODROP, "hatred")

/// THE PLAN B ///

/obj/item/gun/ballistic/shotgun/doublebarrel/hatred_sawn_off
	name = "\proper The \"Plan B\""
	desc = "The scratches on this sawn-off double-barreled shotgun say: \"Plan B\"."
	resistance_flags = FIRE_PROOF | ACID_PROOF
	box_reload_penalty = FALSE
	spread = -100 // will become ~0 during math things. we do it to reduce sawn_off spread.
	accepted_magazine_type = /obj/item/ammo_box/magazine/internal/shot/dual/slugs
	// copy-paste from proc/sawoff() since we don't have existing solutions.
	sawn_off = TRUE
	w_class = WEIGHT_CLASS_NORMAL
	weapon_weight = WEAPON_MEDIUM
	lefthand_file = 'icons/mob/inhands/weapons/guns_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/weapons/guns_righthand.dmi'
	inhand_x_dimension = 32
	inhand_y_dimension = 32
	inhand_icon_state = "gun"
	worn_icon_state = "gun"
	slot_flags = ITEM_SLOT_BELT
	recoil = SAWN_OFF_RECOIL

/obj/item/gun/ballistic/shotgun/doublebarrel/hatred_sawn_off/Initialize(mapload)
	. = ..()
	update_appearance()

/obj/item/storage/belt/holster/hatred_sawn_off
	name = "\proper The \"Plan B\" Holster"
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/storage/belt/holster/hatred_sawn_off/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = INFINITY // only for weight calculations. it still has type and slots limits
	atom_storage.numerical_stacking = FALSE
	atom_storage.max_slots = 1
	atom_storage.quickdraw = TRUE
	atom_storage.set_holdable(list(/obj/item/gun/ballistic/shotgun/doublebarrel/hatred_sawn_off), list(), list(/obj/item/gun/ballistic/shotgun/doublebarrel/hatred_sawn_off))
	new /obj/item/gun/ballistic/shotgun/doublebarrel/hatred_sawn_off(src)

/// THE PISTOL OF HATRED ///

/obj/item/gun/ballistic/automatic/pistol/m1911/hatred
	// spawn_magazine_type = /obj/item/ammo_box/magazine/m45/ap
	name = "\proper M1911 of Hatred"
	desc = "The scratches on this pistol say: \"The Executioner\"."
	resistance_flags = FIRE_PROOF | ACID_PROOF
	// 100% = 30
	// 90% = 27
	// 80% = 24
	projectile_damage_multiplier = 0.85
	dual_wield_spread = 5
	var/mob/living/carbon/human/original_owner = null

// /obj/item/ammo_box/magazine/m45/ap
// 	name = "handgun magazine (.45 AP)"
// 	MAGAZINE_TYPE_ARMORPIERCE
// 	ammo_type = /obj/item/ammo_casing/c45/ap

/obj/item/gun/ballistic/automatic/pistol/m1911/hatred/equipped(mob/user, slot, initial)
	. = ..()
	if(isnull(original_owner) && ishuman(loc) && slot == ITEM_SLOT_HANDS)
		original_owner = loc

/obj/item/gun/ballistic/automatic/pistol/m1911/hatred/dropped(mob/user, silent)
	. = ..()
	if(!QDELETED(src))
		addtimer(CALLBACK(src, PROC_REF(check_destroy_pistol), user), 3 SECONDS, TIMER_DELETE_ME)

/obj/item/gun/ballistic/automatic/pistol/m1911/hatred/proc/check_destroy_pistol(mob/user)
	if(!QDELETED(src) && original_owner != loc)
		visible_message("[src] рассыпается в прах на ваших глазах...")
		var/obj/effect/decal/cleanable/ash/ash = new /obj/effect/decal/cleanable/ash(get_turf(loc))
		ash.pixel_z = -5
		ash.pixel_w = rand(-1, 1)
		qdel(src)

// говно с оффов неправильно обрабатывает стрельбу с двух рук
/obj/item/gun/ballistic/automatic/pistol/m1911/hatred/process_fire(atom/target, mob/living/user, message, params, zone_override, bonus_spread)
	. = ..()
	if(!. || bolt_locked) // if no shot has been made or postfire_empty_checks(.) has already been fully handled
		return
	postfire_empty_checks(.)

/obj/item/gun/ballistic/automatic/pistol/m1911/hatred/postfire_empty_checks(last_shot_succeeded)
	. = ..()
	if(bolt_locked && ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.dropItemToGround(src, force = TRUE, silent = FALSE)
		H.visible_message("[H] nonchalantly drops his empty pistol on the ground as soon as he makes a last shot.")

/// THE HOLSTER OF HATRED ///

/obj/item/storage/belt/holster/hatred
	name = "\proper Holster of Hatred"
	desc = "The cursed holster is always ready to supply you with new tools of Genocide."
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/storage/belt/holster/hatred/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = INFINITY // only for weight calculations. it still has type and slots limits
	atom_storage.numerical_stacking = FALSE
	atom_storage.max_slots = 2
	atom_storage.quickdraw = TRUE
	atom_storage.set_holdable(list(/obj/item/gun/ballistic/automatic/pistol/m1911/hatred), list(), list(/obj/item/gun/ballistic/automatic/pistol/m1911/hatred))
	new /obj/item/gun/ballistic/automatic/pistol/m1911/hatred(src)
	new /obj/item/gun/ballistic/automatic/pistol/m1911/hatred(src)

/obj/item/storage/belt/holster/hatred/equipped(mob/user, slot)
	. = ..()
	if(slot in list(ITEM_SLOT_BELT, ITEM_SLOT_SUITSTORE))
		ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/storage/belt/holster/hatred/dropped(mob/user, silent)
	. = ..()
	if(!QDELETED(src))
		// REMOVE_TRAIT(src, TRAIT_NODROP, "hatred")
		visible_message("[src] рассыпается в прах на ваших глазах...")
		qdel(src)

/obj/item/storage/belt/holster/hatred/Exited(atom/movable/gone, direction)
	. = ..()
	if(!QDELETED(src) && !QDELETED(atom_storage))
		new /obj/item/gun/ballistic/automatic/pistol/m1911/hatred(src)
		atom_storage.refresh_views()
		update_appearance()

/// THE POUCH OF HATRED ///

/obj/item/storage/pouch/ammo/hatred
	name = "\proper Ammo pouch of Hatred"
	desc = "The cursed pouch with infinite bullets encourage you to relentlessly continue your atrocities against humanity. What a miracle and delight for your Genocide Machines."
	unique_reskin = null
	resistance_flags = FIRE_PROOF | ACID_PROOF
	// uses_advanced_reskins = FALSE

/obj/item/storage/pouch/ammo/hatred/Initialize(mapload)
	. = ..()
	atom_storage.max_total_storage = INFINITY // only for weight calculations. it still has type and slots limits
	atom_storage.max_specific_storage = WEIGHT_CLASS_NORMAL
	atom_storage.numerical_stacking = FALSE
	atom_storage.attack_hand_interact = TRUE

/obj/item/storage/pouch/ammo/hatred/post_reskin(mob/our_mob)
	return // its reskin changes properties of its inner contrainer. no comments.

/obj/item/storage/pouch/ammo/hatred/examine(mob/user)
	. = ..()
	. += "If you place an empty magazine/clip into this phenomenal pouch next time you check it will be filled with bullets."
	. += span_notice("Click [span_bold("RMB")] to open.")
	. += span_notice("Once you lose this item it will turn into dust.")

/obj/item/storage/pouch/ammo/hatred/Entered(atom/movable/AM, atom/oldLoc)
	. = ..()
	var/M = AM.type
	qdel(AM)
	new M(src)
	atom_storage.refresh_views()
	update_appearance()

/obj/item/storage/pouch/ammo/hatred/equipped(mob/user, slot, initial)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/storage/pouch/ammo/hatred/dropped(mob/user, silent)
	. = ..()
	if(!QDELETED(src))
		visible_message("[src] рассыпается в прах на ваших глазах...")
		qdel(src)

/// THE BELT OF HATRED ///

/obj/item/storage/belt/military/assault/hatred
	name = "\proper Belt of Hatred"
	desc = "The cursed belt eagerly devours hearts of your victims and supplies you with new deadly explosives."
	resistance_flags = FIRE_PROOF | ACID_PROOF
	var/glory_points = 0

/obj/item/storage/belt/military/assault/hatred/examine(mob/user)
	. = ..()
	. += "If you place a heart into this phenomenal belt next time you check there will be no heart but a deadly explosive."
	. += span_notice("[src] is ready to accept [span_bold("[glory_points]")] hearts. Get more Glory Kills to make it accept more.")
	. += span_notice("Once you lose this item it will turn into dust.")

/obj/item/storage/belt/military/assault/hatred/Entered(atom/movable/AM, atom/oldLoc)
	. = ..()
	if(istype(AM, /obj/item/organ/heart) && glory_points)
		glory_points--
		qdel(AM)
		switch(rand(1,3))
			if(1)
				new /obj/item/grenade/syndieminibomb/concussion(src)
			if(2)
				new /obj/item/grenade/frag(src)
			if(3)
				var/obj/item/reagent_containers/cup/glass/bottle/molotov/mol = new /obj/item/reagent_containers/cup/glass/bottle/molotov(src)
				mol.reagents.add_reagent(/datum/reagent/consumable/ethanol/vodka, 100)
		atom_storage.refresh_views()
		update_appearance()

/obj/item/storage/belt/military/assault/hatred/equipped(mob/user, slot, initial)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/storage/belt/military/assault/hatred/dropped(mob/user, silent)
	. = ..()
	if(!QDELETED(src))
		visible_message("[src] рассыпается в прах на ваших глазах...")
		qdel(src)

/// THE OVERCOAT OF HATRED ///

/obj/item/clothing/suit/jacket/leather_trenchcoat/hatred
	name = "\proper Leather overcoat of Hatred"
	desc = "The shabby leather overcoat with decent armor paddings and special lightweight kevlar. Once it has been splashed with blood you can't take it off anymore."
	armor_type = /datum/armor/hatred
	resistance_flags = FIRE_PROOF
	body_parts_covered = CHEST|GROIN|ARMS|LEGS // just like HOS' armored trenchcoat
	cold_protection = CHEST|GROIN|ARMS|LEGS
	heat_protection = CHEST|GROIN|ARMS|LEGS
	max_heat_protection_temperature = ARMOR_MAX_TEMP_PROTECT
	var/is_trophy = FALSE

/obj/item/clothing/suit/jacket/leather_trenchcoat/hatred/Initialize(mapload)
	. = ..()
	allowed += list(/obj/item/storage/belt/holster)

// clueless armor stats.
/datum/armor/hatred
	melee = 40
	bullet = 40
	laser = 40
	energy = 40
	bomb = 40
	bio = 40
	fire = 70
	acid = 70
	wound = WOUND_ARMOR_STANDARD

// level 2 gear upgrade. +10
/datum/armor/hatred_more
	melee = 50
	bullet = 50
	laser = 50
	energy = 50
	bomb = 50
	bio = 50
	fire = 80
	acid = 80
	wound = WOUND_ARMOR_HIGH

/obj/item/clothing/suit/jacket/leather_trenchcoat/hatred/equipped(mob/user, slot)
	. = ..()
	if(slot == ITEM_SLOT_OCLOTHING && !is_trophy)
		ADD_TRAIT(src, TRAIT_NODROP, "hatred")
		var/datum/antagonist/hatred/Ha = user.mind?.has_antag_datum(/datum/antagonist/hatred)
		if(Ha?.chosen_gun == "Pistols")
			RegisterSignal(user, COMSIG_LIVING_DEATH, PROC_REF(on_hatred_death))

/obj/item/clothing/suit/jacket/leather_trenchcoat/hatred/proc/on_hatred_death()
	SIGNAL_HANDLER
	var/obj/item/clothing/suit/jacket/leather_trenchcoat/hatred/I = new type(get_turf(src))
	I.desc = "The blood stained shabby leather overcoat with decent armor paddings and special lightweight kevlar."
	I.max_integrity = 400
	I.update_integrity(I.max_integrity) // will be damaged during antag's death implant detonation
	I.is_trophy = TRUE

/obj/item/clothing/suit/jacket/leather_trenchcoat/hatred/dropped(mob/user)
	. = ..()
	if(!QDELETED(src) && !is_trophy)
		REMOVE_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/clothing/head/invisihat/hatred
	name = "\proper Veil of Hatred"
	desc = "Once you felt <b><i>that</i></b> urge to commit relentless genocide of civilians, you clearly understood you were cursed... blessed... and... protected by invisible Veil of Hatred."
	armor_type = /datum/armor/hatred
	resistance_flags = FIRE_PROOF

/obj/item/clothing/head/invisihat/hatred/equipped(mob/user, slot)
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, "hatred")

/obj/item/clothing/head/invisihat/hatred/dropped(mob/user)
	. = ..()
	if(!QDELETED(src))
		visible_message("[src] рассыпается в прах на ваших глазах...")
		qdel(src)

/// OUTFIT ///
/// defult gear. will be changed during pre_equip().
/datum/outfit/hatred
	name = "Hatred"
	head = /obj/item/clothing/head/invisihat/hatred // /obj/item/clothing/glasses/hud/ar/aviator/health // black gas mask // black turtleneck /obj/item/clothing/glasses/hud/health/sunglasses
	glasses = /obj/item/clothing/glasses/hud/health/sunglasses // to help player identify when a target is in crit so player can safely execute him
	uniform = /obj/item/clothing/under/syndicate/tacticool/black
	suit = /obj/item/clothing/suit/jacket/leather_trenchcoat/hatred
	gloves = /obj/item/clothing/gloves/tackler/combat/insulated
	shoes = /obj/item/clothing/shoes/jackboots/knee // /obj/item/clothing/shoes/combat
	id = /obj/item/card/id/away/old
	l_pocket = /obj/item/storage/pouch/ammo/hatred
	// suit_store = /obj/item/flashlight/seclite // the light doesn't work after spawn for some reason
	belt = /obj/item/storage/belt/military/assault
	back = /obj/item/storage/backpack/satchel/fireproof // /obj/item/storage/backpack/duffelbag/syndie/nri/captain
	backpack_contents = list(/obj/item/storage/box/survival/engineer = 1,
		/obj/item/knife/combat = 1,
		/obj/item/flashlight/seclite = 1,
		/obj/item/crowbar = 1
		// /obj/item/lighter/skull = 1
		)
	// r_hand = /obj/item/gun/ballistic/automatic/ar/ak12/hatred
	implants = list(/obj/item/implant/explosive)

/datum/outfit/hatred/pre_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	var/datum/antagonist/hatred/Ha = H.mind?.has_antag_datum(/datum/antagonist/hatred)
	if(!Ha)
		return
	// Ha.gear_level = tgui_input_list(H, "ЭТО ОКОШКО ДЛЯ ОБМАНА ПОДСЧЕТА ОФИЦЕРОВ В РАУНДЕ И НУЖНО ТОЛЬКО ДЛЯ ДЕБАГА, В ИГРЕ ЕГО НЕ БУДЕТ", "gear level?", list(1, 2), 1)
	var/available_sets = Ha.classic_guns
	SEND_SOUND(H, 'sound/announcer/notice/notice2.ogg')
	Ha.chosen_gun = tgui_input_list(H, "Выбери стартовое оружие и сделай это БЫСТРО!", "Выбери оружие геноцида", available_sets, available_sets[1], 10 SECONDS)
	switch(Ha.chosen_gun)
		if(null)
			Ha.chosen_gun = "AK12"
			r_hand = /obj/item/gun/ballistic/automatic/ar/ak12/hatred
		if("AK12")
			r_hand = /obj/item/gun/ballistic/automatic/ar/ak12/hatred
		if("Riot Shotgun")
			r_hand = /obj/item/gun/ballistic/shotgun/riot/hatred
			suit_store = /obj/item/storage/belt/holster/hatred_sawn_off
		if("Pistols")
			suit_store = /obj/item/storage/belt/holster/hatred
			l_pocket = null
			ADD_TRAIT(H, TRAIT_DOUBLE_TAP, "hatred")
	if(Ha.gear_level == 2)
		// if(Ha.chosen_gun == "Pistols")
		// 	Ha.high_gear += "Shoot faster"
		belt = /obj/item/storage/belt/military/assault/hatred
		Ha.chosen_high_gear = tgui_input_list(H, "Выбери дополнительную экипировку и сделай это БЫСТРО!", "Выбери оружие геноцида", Ha.high_gear, Ha.high_gear[1], 10 SECONDS)
		switch(Ha.chosen_high_gear)
			if(null)
				Ha.chosen_high_gear = "More armor"
				// belt = /obj/item/storage/belt/military/assault/hatred
			// if("Belt of Hatred")
			// 	belt = /obj/item/storage/belt/military/assault/hatred
			// if("Shoot faster")
			// 	ADD_TRAIT(H, TRAIT_DOUBLE_TAP, "hatred")

/datum/outfit/hatred/post_equip(mob/living/carbon/human/H, visualsOnly, client/preference_source)
	// var/obj/item/implant/explosive/E = new
	// E.implant(H)
	var/obj/item/clothing/under/U = H.get_item_by_slot(ITEM_SLOT_ICLOTHING)
	U.has_sensor = NO_SENSORS
	U.resistance_flags = FIRE_PROOF | ACID_PROOF
	U.unique_reskin = null
	ADD_TRAIT(U, TRAIT_NODROP, "hatred")

	var/obj/item/clothing/I = H.get_item_by_slot(ITEM_SLOT_FEET)
	I.resistance_flags = FIRE_PROOF

	I = H.get_item_by_slot(ITEM_SLOT_EYES)
	I.resistance_flags = FIRE_PROOF

	I = H.get_item_by_slot(ITEM_SLOT_GLOVES)
	I.resistance_flags = FIRE_PROOF

	var/obj/item/card/id/advanced/A = H.get_item_by_slot(ITEM_SLOT_ID)
	A.name = "Mangled ID Card"
	A.desc = "Deep cuts and scratches made its inscriptions and pics unreadable."
	A.access = list(/*REGION_ACCESS_GENERAL, */ACCESS_MAINT_TUNNELS)

	var/obj/item/storage/belt/B = H.get_item_by_slot(ITEM_SLOT_BELT)
	new /obj/item/grenade/syndieminibomb/concussion(B)
	new /obj/item/grenade/frag(B)
	var/obj/item/reagent_containers/cup/glass/bottle/molotov/mol = new /obj/item/reagent_containers/cup/glass/bottle/molotov(B)
	mol.reagents.add_reagent(/datum/reagent/consumable/ethanol/vodka, 100)
	new /obj/item/lighter/skull(B)

	var/obj/item/storage/pouch/ammo/hatred/P = H.get_item_by_slot(ITEM_SLOT_LPOCKET)
	var/datum/antagonist/hatred/Ha = H.mind?.has_antag_datum(/datum/antagonist/hatred)
	if(!Ha)
		return
	switch(Ha.chosen_gun)
		if("AK12")
			P.atom_storage.set_holdable(list(/obj/item/ammo_box/magazine/ak12), list(), list(/obj/item/ammo_box/magazine/ak12))
			new /obj/item/ammo_box/magazine/ak12(P)
			new /obj/item/ammo_box/magazine/ak12(P)
		if("Riot Shotgun")
			P.atom_storage.set_holdable(list(/obj/item/ammo_box/advanced/s12gauge), list(), list(/obj/item/ammo_box/advanced/s12gauge))
			P.atom_storage.max_slots = 10
			new /obj/item/ammo_box/advanced/s12gauge/laser(P)
			new /obj/item/ammo_box/advanced/s12gauge(P)
			// new /obj/item/ammo_box/magazine/m12g/slug(P)
			// new /obj/item/ammo_box/advanced/s12gauge/incendiary(P)
			new /obj/item/ammo_box/advanced/s12gauge/flechette(P)
			// new /obj/item/ammo_box/advanced/s12gauge/express(P)
			new /obj/item/ammo_box/advanced/s12gauge/dragonsbreath(P)
			new /obj/item/ammo_box/advanced/s12gauge/frangible(P)
			// new /obj/item/ammo_box/advanced/s12gauge/breaching(P)
		if("Pistols")
			I = H.get_item_by_slot(ITEM_SLOT_OCLOTHING)
			I.resistance_flags = FIRE_PROOF | ACID_PROOF // to prevent the holster of Hatred to be dropped and lost forever.

	switch(Ha.chosen_high_gear)
		if("More armor")
			var/obj/item/clothing/C = H.get_item_by_slot(ITEM_SLOT_OCLOTHING)
			C.set_armor(/datum/armor/hatred_more)
			C = H.get_item_by_slot(ITEM_SLOT_HEAD)
			C.set_armor(/datum/armor/hatred_more)

//////////////////////////////////////////////
//                                          //
//        	 	DYNAMIC THINGS		        //
//                                          //
//////////////////////////////////////////////

/datum/dynamic_ruleset/midround/from_ghosts/hatred
	name = "Mass Shooter"
	config_tag = "Mass Shooter"
	candidate_role = "Mass Shooter"
	preview_antag_datum = /datum/antagonist/hatred
	midround_type = HEAVY_MIDROUND
	pref_flag = ROLE_MASS_SHOOTER
	ruleset_flags = RULESET_INVADER
	weight = list(
		DYNAMIC_TIER_LOW = 0,
		DYNAMIC_TIER_LOWMEDIUM = 0,
		DYNAMIC_TIER_MEDIUMHIGH = 0,
		DYNAMIC_TIER_HIGH = 9, // будет 7 или 8, так как этот антаг имеет высокие требования к количеству живых офицеров и в нагруженные динамики это требование будет невыполено. на время бета теста выставлено 9.
	)
	min_pop = 30
	max_antag_cap = 1
	repeatable = FALSE // one man is enough to shake this station.
	signup_atom_appearance = /obj/item/gun/ballistic/automatic/ar/ak12

/datum/dynamic_ruleset/midround/from_ghosts/hatred/can_be_selected()
	. = ..()
	if(!.)
		return
	. = FALSE
	if(SSsecurity_level.get_current_level_as_number() in list(SEC_LEVEL_GREEN)) // разбавляем эксту внутривенно
		if(length(SSjob.get_living_sec()) < 4)
			return
	else if(length(SSjob.get_living_sec()) < 5) // я желаю достойного сопротивления.
		return
	return TRUE

/datum/dynamic_ruleset/midround/from_ghosts/hatred/create_ruleset_body()
	return // this shit forces player main character appearance

/datum/dynamic_ruleset/midround/from_ghosts/hatred/assign_role(datum/mind/candidate)
	// var/turf/entry_spawn_loc
	// /area/awaymission/errorroom
	var/mob/living/carbon/human/body = new (GET_ERROR_ROOM) // what a fine empty room. why don't we borrow it for a couple of seconds during preparation.
	// body.move_to_error_room()
	candidate.transfer_to(body, force_key_move = TRUE)
	body.dna.remove_all_mutations()
	body.dna.update_dna_identity()
	candidate.set_assigned_role(SSjob.get_job_type(/datum/job/hatred))
	candidate.add_antag_datum(/datum/antagonist/hatred)
	// message_admins("[ADMIN_LOOKUPFLW(body)] has been made into a Mass Shooter by the midround ruleset.")
	// log_game("DYNAMIC: [key_name(body)] was spawned as a Mass Shooter by the midround ruleset.")

//////////////////////////////////////////////
//                                          //
//        ROUND EVENT CONTROL THINGS		//
//                                          //
//////////////////////////////////////////////

/datum/round_event_control/hatred
	name = "Spawn Mass Shooter"
	typepath = /datum/round_event/ghost_role/hatred
	track = EVENT_TRACK_GHOSTSET
	tags = list(TAG_COMBAT, TAG_HIGH) // more strict additional checks will be done during can_spawn_event().
	weight = 20 // может появиться в одном единственном режиме игры при соблюдении серьезных требований и таймингов, поэтому х2
	max_occurrences = 1
	min_players = 20 // для малфа нужно 20. и для демона резни. пусть будет так. меньше не надо - некого убивать.
	earliest_start = 50 MINUTES // какого то хуя походу считает от запуска мира, а не от старта раунда
	category = EVENT_CATEGORY_ENTITIES // bloodshed. genocide. quite simple desires.
	description = "The Man without a name is about to commit ruthless genocide of crewmembers."

/datum/round_event/ghost_role/hatred
	minimum_required = 1
	role_name = "Mass Shooter"
	announce_chance = 0
	fakeable = FALSE

/datum/round_event_control/hatred/can_spawn_event(players_amt, allow_magic)
	if(!istype(SSgamemode.storyteller, /datum/storyteller/high)) // only for high dynamics
		return FALSE
	// if(!(SSgamemode.storyteller.storyteller_type in list(STORYTELLER_TYPE_INTENSE))) // only for high dynamics
	// 	return FALSE
	// if(!SSdynamic.antag_events_enabled) // это подсистема все равно пока что не работает, так что похуй
	// 	return FALSE
	// if(EMERGENCY_PAST_POINT_OF_NO_RETURN)
	// 	return FALSE
	if(SSsecurity_level.get_current_level_as_number() in list(SEC_LEVEL_GREEN)) // разбавляем эксту внутривенно
		if(length(SSjob.get_living_sec()) < 4)
			return FALSE
	else if(length(SSjob.get_living_sec()) < 5) // я желаю достойного сопротивления.
		return FALSE
	return ..()

/datum/round_event/ghost_role/hatred/spawn_role()
	var/turf/entry_spawn_loc = GET_ERROR_ROOM // what a fine empty room. why don't we borrow it for a couple of seconds during preparation.
	if(isnull(entry_spawn_loc) || isnull(find_safe_turf(extended_safety_checks = TRUE, dense_atoms = FALSE))) // we'll send him on station right away so we think ahead.
		return MAP_ERROR
	var/mob/chosen_one = SSpolling.poll_ghost_candidates(check_jobban = ROLE_MASS_SHOOTER, role = ROLE_MASS_SHOOTER, alert_pic = /obj/item/gun/ballistic/automatic/ar/ak12, role_name_text = "Mass Shooter", amount_to_pick = 1)
	if(isnull(chosen_one))
		return NOT_ENOUGH_PLAYERS
	var/mob/living/carbon/human/body = new (entry_spawn_loc)
	// body.move_to_error_room()
	// body.PossessByPlayer(chosen_one.key)
	var/datum/mind/Mind = new /datum/mind(chosen_one.key)
	Mind.active = TRUE
	Mind.transfer_to(body)
	Mind.set_assigned_role(SSjob.get_job_type(/datum/job/hatred))
	Mind.add_antag_datum(/datum/antagonist/hatred)
	// playsound(dragon, 'sound/effects/magic/ethereal_exit.ogg', 50, TRUE, -1)
	message_admins("[ADMIN_LOOKUPFLW(body)] has been made into a Mass Shooter by an event.")
	body.log_message("was spawned as a Mass Shooter by an event.", LOG_GAME)
	spawned_mobs += body
	return SUCCESSFUL_SPAWN
