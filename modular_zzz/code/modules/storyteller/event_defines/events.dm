/datum/round_event_control/mutant_infestation
	weight = 1
	tags = list(TAG_COMMUNAL, TAG_COMBAT, TAG_CHAOTIC, TAG_CREW_ANTAG, TAG_HIGH)

/datum/round_event_control/radiation_storm
	max_occurrences = 1

/datum/round_event_control/sandstorm // it's a shittier meteor wave that kills the server trying to process all the debris
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_COMMUNAL, TAG_SPACE, TAG_DESTRUCTIVE, TAG_CHAOTIC, TAG_LOW)
	weight = 10
	max_occurrences = 3

/datum/round_event_control/sandstorm_classic // it's a shittier meteor wave that kills the server trying to process all the debris
	track = EVENT_TRACK_MAJOR
	tags = list(TAG_COMMUNAL, TAG_SPACE, TAG_DESTRUCTIVE, TAG_CHAOTIC, TAG_MEDIUM)
	weight = 5
	max_occurrences = 1

/datum/round_event_control/meteor_wave/catastrophic
	weight = 1

/datum/round_event_control/scrubber_overflow/threatening
	weight = 4
	max_occurrences = 1

/datum/round_event_control/scrubber_overflow/catastrophic
	weight = 2
	max_occurrences = 1

/datum/round_event_control/scrubber_overflow/every_vent
	weight = 1
	max_occurrences = 1

/datum/round_event_control/voidwalker
	max_occurrences = 1

/datum/round_event_control/easter
	weight = -1
	max_occurrences = 1

/datum/round_event_control/valentines
	weight = -1
	max_occurrences = 1

/datum/round_event_control/spooky
	weight = -1
	max_occurrences = 1
