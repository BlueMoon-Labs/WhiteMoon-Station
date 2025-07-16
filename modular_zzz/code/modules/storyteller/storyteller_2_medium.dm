/datum/storyteller/medium
	name = "Medium Dynamic"
	desc = "Будут как и скрытные антагонисты, так и более агрессивные, которые уже смогут начинать \
	прямые конфронтации и стычки со Службой Безопасности Космической Станции. Стоит ожидать более повышенный \
	накал раунда. Вам предстоит встретиться от полноценного смешения спокойной ролевой игры и полноценных, и зачастую грубых механик. \
	Всё зависит от ситуации и от того, что делает антагонист. В данном режиме игры любой антагонист со скрытными целями может попросить \
	разрешение на массовый гриф у администрации."
	track_data = /datum/storyteller_data/tracks/med_chaos
	tag_multipliers = list(
		TAG_COMBAT = 1.25,
		TAG_DESTRUCTIVE = 0.9,
		TAG_CHAOTIC = 1.1,
		TAG_LOW = 1,
		TAG_MEDIUM = 1,
		TAG_HIGH = 0.5
		)
	antag_divisor = 16
	votable = FALSE

/datum/storyteller_data/tracks/med_chaos
	threshold_mundane = 1500
	threshold_moderate = 2000
	threshold_major = 3000
	threshold_crewset = 3000
	threshold_ghostset = 3000
