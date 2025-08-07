/datum/round_event/portal_storm/syndicate_shocktroop
	boss_types = list(/mob/living/basic/trooper/syndicate/ranged/space/anthro/cat = 3,\
					/mob/living/basic/trooper/syndicate/ranged/shotgun/space/stormtrooper/anthro/fox = 3,\
					/mob/living/basic/trooper/syndicate/melee/space/anthro/lizard = 3)
	hostile_types = list(/mob/living/basic/trooper/syndicate/melee/anthro = 8,\
						/mob/living/basic/trooper/syndicate/melee/sword/anthro = 6,\
						/mob/living/basic/trooper/syndicate/ranged/smg/anthro = 4,\
						/mob/living/basic/trooper/syndicate/ranged/anthro = 4,\
						/mob/living/basic/viscerator = 8)
	triggersound = 'modular_zzz/sound/ambience/storm/syndie_storm.ogg'

/datum/round_event/portal_storm/portal_storm_narsie
	boss_types = list(/mob/living/simple_animal/hostile/cult/magic/elite = 2)
	hostile_types = list(/mob/living/basic/construct/juggernaut/hostile = 6,\
						/mob/living/basic/construct/artificer/hostile = 6,\
						/mob/living/basic/construct/wraith/hostile = 6,\
						/mob/living/simple_animal/hostile/cult/ghost = 4,\
						/mob/living/simple_animal/hostile/cult/mannequin = 4,\
						/mob/living/simple_animal/hostile/cult/horror = 4,\
						/mob/living/simple_animal/hostile/cult/warrior = 4,\
						/mob/living/simple_animal/hostile/cult/spear = 2,\
						/mob/living/simple_animal/hostile/cult/assassin = 2,\
						/mob/living/simple_animal/hostile/cult/magic = 2)
	triggersound = 'modular_skyrat/modules/alerts/sound/misc/admin_horror_music.ogg'

/datum/round_event_control/portal_storm_clown
	name = "Portal Storm: Clowns"
	typepath = /datum/round_event/portal_storm/portal_storm_clown
	weight = 1
	min_players = 15
	earliest_start = 30 MINUTES
	max_occurrences = 1
	category = EVENT_CATEGORY_ENTITIES

/datum/round_event/portal_storm/portal_storm_clown
	boss_types = list(/mob/living/basic/clown/clownhulk = 1)
	hostile_types = list(/mob/living/basic/clown/mutant = 7,\
						/mob/living/basic/clown/mutant/glutton = 4,\
						/mob/living/basic/clown/longface = 4,\
						/mob/living/basic/clown/clownhulk/honkmunculus = 7,\
						/mob/living/basic/clown/lube = 5,\
						/mob/living/basic/clown/banana = 5,\
						/mob/living/basic/clown/fleshclown = 4)
	triggersound = 'modular_zzz/sound/ambience/storm/clown_storm.ogg'

/datum/round_event/portal_storm
	var/triggersound

/datum/round_event/portal_storm/announce(fake)
	set waitfor = FALSE
	sound_to_playing_players('sound/effects/magic/lightning_chargeup.ogg')
	sleep(8 SECONDS)
	priority_announce("На [station_name()] зафиксирована крупная блюспейс-аномалия. Приготовьтесь к столкновению с угрозами прошлого и будущего.", "Центральное Командование, Отдел Работы с Реальностью", triggersound)
	sleep(2 SECONDS)
	sound_to_playing_players('sound/effects/magic/lightningbolt.ogg')
