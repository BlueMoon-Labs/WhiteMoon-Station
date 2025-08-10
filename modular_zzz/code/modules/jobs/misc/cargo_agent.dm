/datum/job/customs_agent
	allow_bureaucratic_error = FALSE

// Remove stowaway from occupations entirely, regardless of map or config
/datum/job/customs_agent/map_check()
	return FALSE
