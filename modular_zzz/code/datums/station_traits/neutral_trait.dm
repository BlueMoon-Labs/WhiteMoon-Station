/datum/station_trait/announcement_horny
	name = "Announcement \"H.O.R.N.Y.\""
	trait_type = STATION_TRAIT_NEUTRAL
	weight = 1
	show_in_report = TRUE
	report_message = "Наша Система Объявления была выкуплена компанией S.E.L.F. на данную смену и они хотят, \
	чтобы мы испытали её на вашей станции."
	blacklist = list(/datum/station_trait/announcement_intern, /datum/station_trait/birthday)

/datum/station_trait/announcement_horny/New()
	. = ..()
	SSstation.announcer = /datum/centcom_announcer/default/lait
