/datum/round_event_control/zombie_infestation
	name = "ROMEROL Pathogen Outbreak"
	typepath = /datum/round_event/zombie_infestation
	weight = 1
	earliest_start = 60 MINUTES
	max_occurrences = 1
	min_players = 50

/datum/round_event/zombie_infestation
	announce_when = 300
	announce_chance = 100
	fakeable = TRUE
	var/infected = 1

/datum/round_event/zombie_infestation/setup()
	. = ..()
	infected = rand(6, 9)

/datum/round_event/zombie_infestation/start()
	. = ..()
	var/infectees = 0
	for(var/mob/living/carbon/human/iterating_human in shuffle(GLOB.player_list))
		if(!is_station_level(iterating_human.z))
			continue
		if(infectees >= infected)
			break
		if(try_to_zombie_infect_event(iterating_human, TRUE))
			infectees++
			notify_ghosts("[iterating_human] has been infected by the ROMEROL pathogen!",
				source = iterating_human,
			)

/datum/round_event/zombie_infestation/announce(fake)
	alert_sound_to_playing(sound('modular_skyrat/modules/alerts/sound/alerts/alert2.ogg'), override_volume = TRUE)
	priority_announce("Автоматизированные системы фильтрации воздуха выявили грибковый патоген 'РОМЕРОЛ' в вентиляционных системах станции, введён карантин.", "ВНИМАНИЕ: БИОЛОГИЧЕСКАЯ ОПАСНОСТЬ", ANNOUNCER_MUTANTS)

/proc/try_to_zombie_infect_event(mob/living/carbon/human/target)
	CHECK_DNA_AND_SPECIES(target)

	// Can't zombify with no head
	if(!target.get_bodypart(BODY_ZONE_HEAD))
		return

	if(HAS_TRAIT(target, TRAIT_NO_ZOMBIFY))
		// cannot infect any TRAIT_NO_ZOMBIFY human
		return

	// spaceacillin has a 75% chance to block infection
	if(HAS_TRAIT(target, TRAIT_VIRUS_RESISTANCE) && !HAS_TRAIT(target, TRAIT_IMMUNODEFICIENCY) && prob(75))
		return

	var/obj/item/organ/zombie_infection/infection
	infection = target.get_organ_slot(ORGAN_SLOT_ZOMBIE)
	if(!infection)
		infection = new()
		infection.Insert(target)

//The virus.
/datum/supply_pack/misc/changeling_zombie
	name = "NT-CZV-1 Vials"
	desc = "Contains a NT-CZV vials. Highly classified."
	special = TRUE //Cannot be ordered via cargo
	contains = list() //We don't put contents in this to do snowflake content in populate_contents
	crate_type = /obj/structure/closet/crate/changeling_zombie

/obj/structure/closet/crate/zombie
	var/virus_released = FALSE

/obj/structure/closet/crate/zombie/after_open(mob/living/user, force)
	. = ..()
	if(!virus_released)
		virus_released = TRUE
		playsound(src, 'sound/effects/smoke.ogg', 50, TRUE, -3)
		var/datum/reagents/zombie_holder = new(10)
		var/zombie_holder_location = get_turf(src)
		zombie_holder.add_reagent(/datum/reagent/romerol, 30)
		var/datum/effect_system/fluid_spread/smoke/chem/quick/smoke = new
		smoke.set_up(6, holder = src, location = zombie_holder_location, carry = zombie_holder)
		smoke.start()
		QDEL_NULL(zombie_holder)

/obj/structure/closet/crate/zombie/PopulateContents()
	new /obj/item/reagent_containers/cup/glass/romerol(src)
	new /obj/item/reagent_containers/cup/glass/romerol/empty(src)

/obj/item/reagent_containers/cup/glass/romerol
	name = "INT-ROM Vial"
	desc = "A small bottle of the INT-ROM pathogen. Interdyne inc."
	icon = 'modular_skyrat/modules/mutants/icons/extractor.dmi'
	icon_state = "tvirus_cure"
	list_reagents = list(/datum/reagent/romerol	=30)
	custom_materials = list(
		/datum/material/glass = HALF_SHEET_MATERIAL_AMOUNT,
	)

/obj/item/reagent_containers/cup/glass/romerol/empty
	list_reagents = list()

/obj/item/reagent_containers/cup/glass/romerol/empty/smash(...)
	if(!list_reagents)
		return
	playsound(src, 'sound/effects/smoke.ogg', 50, TRUE, -3)
	var/datum/reagents/zombie_holder = new(10)
	var/zombie_holder_location = get_turf(src) //we need to set up the smoke beforehand
	zombie_holder.add_reagent(/datum/reagent/romerol, 30)
	var/datum/effect_system/fluid_spread/smoke/chem/quick/smoke = new
	smoke.set_up(6, holder = src, location = zombie_holder_location, carry = zombie_holder)
	smoke.start()
	QDEL_NULL(zombie_holder) // Reagents have a ref to their holder which has a ref to them. No leaks please.
