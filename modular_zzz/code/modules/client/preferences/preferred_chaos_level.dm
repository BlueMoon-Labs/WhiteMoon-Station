/datum/preference/numeric/preferred_chaos_level
	category = PREFERENCE_CATEGORY_GAME_PREFERENCES
	savefile_key = "preferred_chaos_level"
	savefile_identifier = PREFERENCE_PLAYER

	minimum = 0
	maximum = 3

/datum/preference/numeric/preferred_chaos_level/create_default_value()
	return 2
