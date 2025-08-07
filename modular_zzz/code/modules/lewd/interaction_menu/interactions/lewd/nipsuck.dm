/datum/interaction/lewd/nipsuck
	name = "Соски: пососать"
	description = "Орально обслужите соски партнёра, языком или зубами - на ваше усмотрение."
	message = list(
		"нежно посасывает сосочек на груди %TARGET%.",
		"плавно и спокойно посасывает грудь %TARGET%.",
		"аккуратно и в такт сосет груди %TARGET%.",
		"слегка прикусив сосочек, посасывает грудь %TARGET%.",
		"облизывает сосочек %TARGET%, заставляя тот возбудиться.",
		"лижет соски груди %TARGET%."
	)

/datum/interaction/lewd/nipsuck/act(mob/living/user, mob/living/target)
	var/list/original_messages = message.Copy()

	// Handle different intents
	// Вариации действий от интента
	switch(resolve_intent_name(user.combat_mode))
		if("harm")
			message = list(
				"неаккуратно кусает сосочек %TARGET%.",
				"дерзко покусывает соски %TARGET%.",
				"грубо и больно кусает сосочки %TARGET%.",
				"напряженно и брутально сосет сосочек %TARGET%.",
				"агрессиво сосет сосок %TARGET%."
			)
			target_pleasure = 4 // Aggressive sucking has higher rewards	// Агрессивное сосание приносит больше пользы
			target_arousal = 5
		if("disarm")
			message = list(
				"игриво кусает сосочек %TARGET%.",
				"игриво сжимая груди %TARGET%, ласково кусает сосок.",
				"дразняще кусается за сиськи %TARGET%.",
				"дразняще крутит соски %TARGET% в своих зубах.",
				"страстно всасывает сосочек %TARGET% в свой рот."
			)
		if("grab")
			message = list(
				"напряженно сосет сосок %TARGET%.",
				"втягивает сосочек %TARGET% в рот, не отпуская грудь.",
				"жадно сосет сосочки %TARGET%.",
				"беспощадно и жадно посасывает соски %TARGET%.",
				"кусает сосочек %TARGET% и тянет на себя."
			)
			target_pleasure = 4 // Intent sucking has higher rewards	// Интент сосания имеет более высокую награду
			target_arousal = 5
	. = ..()
	message = original_messages

	if(!user.combat_mode && prob(5 + target.arousal))
		var/list/arousal_messages
		switch(resolve_intent_name(user.combat_mode))
			if("help")
				arousal_messages = list(
					"%TARGET% подрагивает от возбуждения.",
					"%TARGET% тихонько вздрагивает, постанывая.",
					"%TARGET% нежно вздыхает.",
					"%TARGET% тихо постанывает.",
					"%TARGET% выдыхает тихий стон.",
					"%TARGET% задыхается от удовольствия.",
					"%TARGET% вздрагивает от приставаний к своей груди."
				)
			if("harm")
				arousal_messages = list(
					"%TARGET% судорожно дрожит от боли.",
					"%TARGET% брутально стонет, ощущая боль.",
					"%TARGET% постанывает от жгучей боли в груди.",
					"%TARGET% дергается от смеси боли и удовольствия."
				)
			if("disarm")
				arousal_messages = list(
					"%TARGET% игриво и нежно извивается.",
					"%TARGET% слегка сжимается, игриво хихикая от игры с грудью.",
					"%TARGET% нежно подрагивает.",
					"%TARGET% дразняще качается.",
					"%TARGET% испускает сладкие стоны.",
					"%TARGET% прикусывает губу от возбуждения.",
					"%TARGET% извивается от прелюдий."
				)
			if("grab")
				arousal_messages = list(
					"%TARGET% стонет от нетерпеливости.",
					"%TARGET% нетерпеливо дрожит с удовольствием.",
					"%TARGET% жаждуще постанывает.",
					"%TARGET% выпячивается вперед грудью, возбужденно вздыхая.",
					"%TARGET% судорожно дрожит в предвкушении."
				)

		if(arousal_messages)
			message = list(pick(arousal_messages))
