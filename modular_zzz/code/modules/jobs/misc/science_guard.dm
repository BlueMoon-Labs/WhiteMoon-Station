/datum/job/science_guard
	allow_bureaucratic_error = FALSE

// Remove stowaway from occupations entirely, regardless of map or config
/datum/job/science_guard/map_check()
	return FALSE
