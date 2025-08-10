/datum/job/orderly
	allow_bureaucratic_error = FALSE

// Remove stowaway from occupations entirely, regardless of map or config
/datum/job/orderly/map_check()
	return FALSE
