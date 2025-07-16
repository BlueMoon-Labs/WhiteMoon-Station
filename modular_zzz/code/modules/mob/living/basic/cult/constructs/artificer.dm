/datum/action/cooldown/spell/aoe/area_conversion/weak
	name = "Lesser Area Conversion"
	cooldown_time = 30 SECONDS

/datum/action/cooldown/spell/conjure/cult_door
	name = "Summon Cult Airlock"
	desc = "This spell constructs a cult airlock."
	background_icon_state = "bg_cult"
	overlay_icon_state = "bg_cult_border"

	button_icon = 'icons/obj/doors/airlocks/cult/runed/cult.dmi'
	button_icon_state = "closed"

	school = SCHOOL_CONJURATION
	cooldown_time = 10 SECONDS
	invocation_type = INVOCATION_NONE
	spell_requirements = NONE

	summon_radius = 0
	summon_type = list(/obj/machinery/door/airlock/cult)

/datum/action/cooldown/spell/conjure/cult_pylon
	name = "Summon Cult Pylon"
	desc = "This spell constructs a cult airlock."
	background_icon_state = "bg_cult"
	overlay_icon_state = "bg_cult_border"

	button_icon = 'icons/obj/antags/cult/structures.dmi'
	button_icon_state = "pylon"

	school = SCHOOL_CONJURATION
	cooldown_time = 30 SECONDS
	invocation_type = INVOCATION_NONE
	spell_requirements = NONE

	summon_radius = 0
	summon_type = list(/obj/structure/destructible/cult/pylon)

/mob/living/basic/construct/artificer/Initialize(mapload)
	. = ..()
	grant_abilities()

/mob/living/basic/construct/artificer/proc/grant_abilities()
	AddElement(/datum/element/wall_walker, /turf/closed/wall/mineral/cult)

/mob/living/basic/construct/artificer
	construct_spells = list(
		/datum/action/cooldown/spell/conjure/construct/lesser,
		/datum/action/cooldown/spell/conjure/cult_floor,
		/datum/action/cooldown/spell/conjure/cult_wall,
		/datum/action/cooldown/spell/conjure/soulstone,
		/datum/action/cooldown/spell/conjure/cult_door,
		/datum/action/cooldown/spell/conjure/cult_pylon,
		/datum/action/cooldown/spell/aoe/magic_missile/lesser,
		/datum/action/cooldown/spell/aoe/area_conversion/weak,
		/datum/action/innate/cult/create_rune/revive,
	)

/mob/living/basic/construct/artificer/mystic
	faction = list(ROLE_WIZARD)
	theme = THEME_WIZARD
	construct_spells = list(
		/datum/action/cooldown/spell/conjure/cult_floor,
		/datum/action/cooldown/spell/conjure/cult_wall,
		/datum/action/cooldown/spell/conjure/soulstone/mystic,
		/datum/action/cooldown/spell/conjure/construct/lesser,
		/datum/action/cooldown/spell/conjure/cult_pylon,
		/datum/action/cooldown/spell/aoe/magic_missile/lesser,
		/datum/action/cooldown/spell/aoe/area_conversion/weak,
		/datum/action/innate/cult/create_rune/revive,
	)

/mob/living/basic/construct/artificer/noncult
	construct_spells = list(
		/datum/action/cooldown/spell/conjure/cult_floor,
		/datum/action/cooldown/spell/conjure/cult_wall,
		/datum/action/cooldown/spell/conjure/soulstone/noncult,
		/datum/action/cooldown/spell/conjure/construct/lesser,
		/datum/action/cooldown/spell/conjure/cult_door,
		/datum/action/cooldown/spell/conjure/cult_pylon,
		/datum/action/cooldown/spell/aoe/magic_missile/lesser,
		/datum/action/cooldown/spell/aoe/area_conversion/weak,
		/datum/action/innate/cult/create_rune/revive,
	)
