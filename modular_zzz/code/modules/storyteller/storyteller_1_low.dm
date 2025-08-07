/datum/storyteller/low
	name = "Light Dynamic"
	desc = "На станции преимущественно скрытые антагонисты, как таковой резни или чересчур серьёзных угроз ожидать не стоит. \
	Этот вид динамика нацелен больше на ролевую игру с антагонистами, нежели чем на прямую конфронтацию с быстрым переходом к механу. \
	В данном режиме игры крупные антагонисты и достижение своих целей через массовый гриф запрещены, исключением является Ядерный Оперативник."
	track_data = /datum/storyteller_data/tracks/low_chaos
	tag_multipliers = list(
		TAG_COMBAT = 0.3,
		TAG_DESTRUCTIVE = 0.3,
		TAG_CHAOTIC = 0.1,
		TAG_LOW = 1,
		TAG_MEDIUM = 0.1,
		TAG_HIGH = 0.05
	)
	antag_divisor = 32
	votable = FALSE

/datum/storyteller_data/tracks/low_chaos
	threshold_mundane = 2000
	threshold_moderate = 2500
	threshold_major = 3500
	threshold_crewset = 4000
	threshold_ghostset = 4000
