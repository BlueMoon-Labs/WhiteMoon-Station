/datum/storyteller/extended_low_chaos
	name = "Extended (Very Low Chaos)"
	desc = "Во время Extended-Раунда количество антагонистов минимально и они сильно ограничены, \
	а также являются мирными, если не сказано обратного. Персонажи могут наслаждаться спокойным пребыванием на станции, \
	либо игрой с мирными антагонистами с упором на Ролевую Игру."
	track_data = /datum/storyteller_data/tracks/extended_low_chaos
	guarantees_roundstart_crewset = FALSE
	tag_multipliers = list(
		TAG_COMBAT = 0,
		TAG_DESTRUCTIVE = 1,
		TAG_CHAOTIC = 1,
		TAG_LOW = 1,
		TAG_MEDIUM = 0,
		TAG_HIGH = 0,
		TAG_COMMUNAL = 1
	)

/datum/storyteller_data/tracks/extended_low_chaos
	threshold_mundane = 1200
	threshold_moderate = 2400
	threshold_major = 15000
	threshold_crewset = 999999
	threshold_ghostset = 999999
