/datum/storyteller/high
	name = "Hard Dynamic"
	desc = "На станции может быть не один и не два антагониста, они могут быть как Крупными-Шумными, так и Малыми-Скрытными. \
	И тем, и другим разрешается добиваться своей цели более шумным образом, точно также, как и СБ может переходить к прямому механу, \
	если на станции слишком много полноценных угроз. От подобного раунда всегда следует ожидать как можно больше разрушений, убийств, анархии. \
	Контролировать такое будет сложно, в связи с чем вам будет представлено конкретное испытание по Выживанию на Космической Станции. TG Server Expirience."
	track_data = /datum/storyteller_data/tracks/high_chaos
	tag_multipliers = list(
		TAG_COMBAT = 1.5,
		TAG_DESTRUCTIVE = 0.7,
		TAG_CHAOTIC = 1.3,
		TAG_LOW = 0.5,
		TAG_MEDIUM = 0.5,
		TAG_HIGH = 1
	)
	antag_divisor = 8
	votable = FALSE

/datum/storyteller_data/tracks/high_chaos
	threshold_mundane = 1000
	threshold_moderate = 1500
	threshold_major = 2500
	threshold_crewset = 2000
	threshold_ghostset = 2000
