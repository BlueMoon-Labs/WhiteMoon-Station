/datum/interaction/lewd/portal/fuck_vagina
	name = "Портальный секс (Вагинальный)"
	description = "Киска через портал? Да, пожалуйста."
	message = list(
		"вдалбливается в киску %TARGET% сквозь портальный фонарик.",
		"проникает в киску %TARGET% своим членом сквозь портальный фонарик.",
		"нежно проталкивается членом в киску %TARGET% сквозь портальный фонарик.",
		"плавно разрабатывает киску %TARGET% сквозь портальный фонарик."
	)
	user_messages = list(
		"Вы чувствуете теплую киску %TARGET%, сжимающуюся вокруг вашего члена через портальный фонарик.",
		"Влага киски %TARGET% обжимает ствол вашего члена через портальный фонарик.",
		"Вы входите глубоко в киску %TARGET% через портальный фонарик."
	)
	target_messages = list(
		"Вы чувствуете, как член %USER% проталкивается в вашу киску через портальные трусики.",
		"Ствол %USER% проскользывает глубоко в ваше влагалище через портал.",
		"Теплый член %USER% заполняет вашу киску через портал."
	)

	hidden_message = list(
		"вдалбливается в портальную киску.",
		"проникает в портальную киску через фонарик.",
		"нежно проталкивается членом в портальную киску сквозь фонарик.",
		"плавно разрабатывает портальную киску."

	)
	hidden_user_messages = list(
		"Вы чувствуете теплую портальную киску, сжимающуюся вокруг вашего члена.",
		"Влага портальной киски обжимает ствол вашего члена.",
		"Вы входите глубоко в портальную киску через фонарик."

	)
	hidden_target_messages = list(
		"Вы чувствуете проталкивающийся в вашу киску член, через портальные трусики.",
		"Ствол горячего члена проскользывает глубоко в ваше влагалище через портал.",
		"Чей-то теплый член заполняет вашу киску через портал."
	)

	cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"%CUMMING% кончает глубоко в киску %CAME_IN%, используя портал.",
			"%CUMMING% наполняет влагалище %CAME_IN% до краёв семенем, используя портал.",
			"%CUMMING% стреляет семенем внутрь киски %CAME_IN%, используя портал."
		),
		CLIMAX_POSITION_TARGET = list(
			"Портальная киска %CUMMING% туго сжимается на члене %CAME_IN% во время оргазма.",
			"%CUMMING% оргазмирует прямо на ствол члена %CAME_IN% через портал.",
			"Вагина %CUMMING% сжимается в оргазме вокруг члена %CAME_IN% через портал."
		)
	)
	cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"Вы глубоко кончаете в киску %CAME_IN%, используя портал.",
			"Вы наполняете влагалище %CAME_IN% до краёв семенем, используя портал.",
			"Вы стреляете семенем внутрь киски %CAME_IN%, используя портал."

		),
		CLIMAX_POSITION_TARGET = list(
			"Ваша портальная киска туго сжимается на члене %CAME_IN% во время оргазма.",
			"Вы оргазмируете прямо на ствол члена %CAME_IN% через портал.",
			"Ваша вагина сжимается в оргазме вокруг члена %CAME_IN% через портал."
		)
	)
	cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"Горячее семя %CUMMING% наполняет вашу киску через портальные трусики.",
			"%CUMMING% наполняет вашу вагину своим семенем через портальные трусики.",
			"Ваша киска наполненна горячим семенем %CUMMING%, благодаря порталу."
		),
		CLIMAX_POSITION_TARGET = list(
			"Вы ощущаете, как портальная киска %CUMMING% туго сжимается на вашем члене во время оргазма.",
			"%CUMMING% оргазмирует прямо на ствол вашего члена через портал.",
			"Вагина %CUMMING% сжимается в оргазме вокруг вашего члена через портал."
		)
	)

	hidden_cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"кончает глубоко в портальную киску.",
			"наполняет портальное влагалище до краёв семенем.",
			"стреляет семенем внутрь портальной киски."
		),
		CLIMAX_POSITION_TARGET = list(
			"Портальная киска сжимается вокруг вашего члена во время оргазма.",
			"Носитель порталок ярко оргазмирует через свои трусики.",
			"Киски портальной вагины сжимается в оргазме."
		)
	)
	hidden_cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"Вы глубоко кончаете в портальную киску.",
			"Вы наполняете портальное влагалище до краёв семенем, используя портал.",
			"Вы стреляете семенем внутрь портальной киски."
		),
		CLIMAX_POSITION_TARGET = list(
			"Ваша киска туго сжимается на портальном члене во время оргазма.",
			"Вы оргазмируете прямо на ствол портального члена.",
			"Ваша вагина сжимается в оргазме вокруг члена через портал."
		)
	)
	hidden_cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"Вы ощущаете, как горячее семя наполняет вашу киску через портальные трусики.",
			"Вас наполняют горячим семенем через портальные трусики.",
			"Ваша киска наполненна горячим семенем благодаря порталу."
		),
		CLIMAX_POSITION_TARGET = list(
			"Вы ощущаете, как портальная киска туго сжимается на вашем члене во время оргазма.",
			"Портальная киска оргазмирует прямо на ствол вашего члена через портал.",
			"Вагина вашего портального любовника сжимается в оргазме вокруг вашего члена."
		)
	)

/datum/interaction/lewd/portal/fuck_vagina/post_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(prob(5 + target.arousal))
		var/list/arousal_messages = list(
			"%TARGET% стонет в удовольствии во время портального секса.",
			"%TARGET% приоткрывает рот в момент как член через портал проникает глубже.",
			"%TARGET% вздрагивает, ощущая, что член протолкнулся глубже через портал.",
			"Тело %TARGET% пробирает дрожь возбуждения от портального проникновения."
		)
		var/target_message = list(pick(arousal_messages))
		target.visible_message(span_lewd(replacetext(target_message, "%TARGET%", target)))

/datum/interaction/lewd/portal/fuck_anus
	name = "Портальный секс (Анальный)"
	description = "Почему бы и не попробовать задницу тоже, раз предлагают?"
	message = list(
		"вдавливает свой член в задницу %TARGET% через портальный фонарик.",
		"долбится в задницу %TARGET%, используя портальный фонарик.",
		"проникает глубоко в тугую попку %TARGET% благодаря портальному фонарику.",
		"пользуется попкой %TARGET% через портальнйы фонарик."
	)
	user_messages = list(
		"Вы ощущете узкую задницу %TARGET%, обжимающую ствол вашего члена через портал.",
		"Вы делаете приятно своему члену благодаря тёплой портальной попке %TARGET%",
		"Вы проникаете глубоко в тугой зад %TARGET% через портальный фонарик."
	)
	target_messages = list(
		"You feel %USER%'s cock pushing into your ass through the portal panties",
		"%USER%'s shaft slides deep into your anus through the portal",
		"The warmth of %USER%'s cock fills your ass through the portal"
	)

	hidden_message = list(
		"rams their cock into the portal fleshlight's ass",
		"pounds into the portal fleshlight's anus",
		"thrusts deep into the portal fleshlight's tight hole",
		"fucks the portal fleshlight's ass"
	)
	hidden_user_messages = list(
		"You feel the tight ass squeezing around your cock through the portal",
		"The warmth of the portal fleshlight's anus envelops your shaft",
		"You thrust deep into the portal fleshlight's tight ass"
	)
	hidden_target_messages = list(
		"You feel a cock pushing into your ass through the portal panties",
		"A shaft slides deep into your anus through the portal",
		"The warmth of a cock fills your ass through the portal"
	)

	cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"%CUMMING% cums hard into %CAME_IN%'s ass through the portal fleshlight",
			"%CUMMING% fills %CAME_IN%'s anus with their seed through the portal fleshlight",
			"%CUMMING% pumps their load deep into %CAME_IN%'s ass through the portal fleshlight"
		),
		CLIMAX_POSITION_TARGET = list(
			"%CUMMING%'s ass squeezes tightly around %CAME_IN%'s cock as they cum through the portal",
			"%CUMMING% climaxes hard on %CAME_IN%'s shaft through the portal",
			"%CUMMING%'s anus contracts in orgasm around %CAME_IN%'s member through the portal"
		)
	)
	cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard into %CAME_IN%'s ass through the portal fleshlight",
			"You fill %CAME_IN%'s anus with your seed through the portal fleshlight",
			"You pump your load deep into %CAME_IN%'s ass through the portal fleshlight"
		),
		CLIMAX_POSITION_TARGET = list(
			"Your ass squeezes tightly around %CAME_IN%'s cock as you cum through the portal",
			"You climax hard on %CAME_IN%'s shaft through the portal",
			"Your anus contracts in orgasm around %CAME_IN%'s member through the portal"
		)
	)
	cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel %CUMMING%'s hot seed flooding your ass through the portal panties",
			"%CUMMING% fills your anus with their cum through the portal panties",
			"Your ass is filled with %CUMMING%'s warm cum through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel %CUMMING%'s ass squeeze around your cock as they cum through the portal",
			"%CUMMING% climaxes on your shaft through the portal fleshlight",
			"The portal fleshlight's ass contracts around your member as %CUMMING% cums"
		)
	)

	hidden_cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"cums hard into the portal fleshlight's ass",
			"fills the portal fleshlight's anus with their seed",
			"pumps their load deep into the portal fleshlight's ass"
		),
		CLIMAX_POSITION_TARGET = list(
			"The portal panties' ass squeezes tightly around the cock as they cum",
			"The wearer climaxes hard through the portal panties",
			"The portal panties' anus contracts in orgasm"
		)
	)
	hidden_cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard into the portal fleshlight's ass",
			"You fill the portal fleshlight's anus with your seed",
			"You pump your load deep into the portal fleshlight's ass"
		),
		CLIMAX_POSITION_TARGET = list(
			"Your ass squeezes tightly around the cock as you cum through the portal",
			"You climax hard through the portal panties",
			"Your anus contracts in orgasm around the member through the portal"
		)
	)
	hidden_cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel hot seed flooding your ass through the portal panties",
			"Warm cum fills your anus through the portal panties",
			"Your ass is filled with cum through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel the ass squeeze around your cock as they cum through the portal",
			"The portal fleshlight's user climaxes on your shaft",
			"The portal fleshlight's ass contracts around your member"
		)
	)

/datum/interaction/lewd/portal/fuck_anus/post_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(prob(5 + target.arousal))
		var/list/arousal_messages = list(
			"%TARGET% moans as they're fucked anally through the portal.",
			"%TARGET% gasps as the cock pushes deeper into their ass through the portal.",
			"%TARGET% trembles from the portal anal fucking.",
			"%TARGET% shudders in arousal from the portal penetration."
		)
		var/target_message = list(pick(arousal_messages))
		target.visible_message(span_lewd(replacetext(target_message, "%TARGET%", target)))

/datum/interaction/lewd/portal/fuck_mouth
	name = "Portal Fuck (Mouth)"
	description = "Fuck their mouth through the portal fleshlight."
	message = list(
		"rams their cock into %TARGET%'s mouth through the portal fleshlight",
		"pounds into %TARGET%'s throat through the portal fleshlight",
		"thrusts deep into %TARGET%'s mouth through the portal fleshlight",
		"fucks %TARGET%'s throat through the portal fleshlight"
	)
	user_messages = list(
		"You feel %TARGET%'s warm mouth around your cock through the portal",
		"The wetness of %TARGET%'s mouth envelops your shaft through the portal",
		"You thrust deep into %TARGET%'s throat through the portal fleshlight"
	)
	target_messages = list(
		"You feel %USER%'s cock pushing into your mouth through the portal panties",
		"%USER%'s shaft slides deep into your throat through the portal",
		"The warmth of %USER%'s cock fills your mouth through the portal"
	)

	hidden_message = list(
		"rams their cock into the portal fleshlight's mouth",
		"pounds into the portal fleshlight's throat",
		"thrusts deep into the portal fleshlight's mouth",
		"fucks the portal fleshlight's throat"
	)
	hidden_user_messages = list(
		"You feel the warm mouth around your cock through the portal",
		"The wetness of the portal fleshlight's mouth envelops your shaft",
		"You thrust deep into the portal fleshlight's throat"
	)
	hidden_target_messages = list(
		"You feel a cock pushing into your mouth through the portal panties",
		"A shaft slides deep into your throat through the portal",
		"The warmth of a cock fills your mouth through the portal"
	)

	cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"%CUMMING% cums hard into %CAME_IN%'s mouth through the portal fleshlight",
			"%CUMMING% fills %CAME_IN%'s throat with their seed through the portal fleshlight",
			"%CUMMING% pumps their load deep into %CAME_IN%'s mouth through the portal fleshlight"
		),
		CLIMAX_POSITION_TARGET = list(
			"%CUMMING%'s mouth works eagerly around %CAME_IN%'s cock as they cum through the portal",
			"%CUMMING% moans around %CAME_IN%'s shaft as they climax through the portal",
			"%CUMMING%'s throat contracts in orgasm around %CAME_IN%'s member through the portal"
		)
	)
	cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard into %CAME_IN%'s mouth through the portal fleshlight",
			"You fill %CAME_IN%'s throat with your seed through the portal fleshlight",
			"You pump your load deep into %CAME_IN%'s mouth through the portal fleshlight"
		),
		CLIMAX_POSITION_TARGET = list(
			"Your mouth works eagerly around %CAME_IN%'s cock as you cum through the portal",
			"You moan around %CAME_IN%'s shaft as you climax through the portal",
			"Your throat contracts in orgasm around %CAME_IN%'s member through the portal"
		)
	)
	cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel %CUMMING%'s hot seed flooding your mouth through the portal panties",
			"%CUMMING% fills your throat with their cum through the portal panties",
			"Your mouth is filled with %CUMMING%'s warm cum through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel %CUMMING%'s mouth work around your cock as they cum through the portal",
			"%CUMMING% moans around your shaft through the portal fleshlight",
			"The portal fleshlight's mouth contracts around your member as %CUMMING% cums"
		)
	)

	hidden_cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"cums hard into the portal fleshlight's mouth",
			"fills the portal fleshlight's throat with their seed",
			"pumps their load deep into the portal fleshlight's mouth"
		),
		CLIMAX_POSITION_TARGET = list(
			"The portal panties' mouth works eagerly around the cock as they cum",
			"The wearer moans around the shaft through the portal panties",
			"The portal panties' throat contracts in orgasm"
		)
	)
	hidden_cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard into the portal fleshlight's mouth",
			"You fill the portal fleshlight's throat with your seed",
			"You pump your load deep into the portal fleshlight's mouth"
		),
		CLIMAX_POSITION_TARGET = list(
			"Your mouth works eagerly around the cock as you cum through the portal",
			"You moan around the shaft as you climax through the portal",
			"Your throat contracts in orgasm around the member through the portal"
		)
	)
	hidden_cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel hot seed flooding your mouth through the portal panties",
			"Warm cum fills your throat through the portal panties",
			"Your mouth is filled with cum through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel the mouth work around your cock as they cum through the portal",
			"The portal fleshlight's user moans around your shaft",
			"The portal fleshlight's mouth contracts around your member"
		)
	)
/datum/interaction/lewd/portal/fuck_mouth/post_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(prob(5 + target.arousal))
		var/list/arousal_messages = list(
			"%TARGET% moans around the cock in their mouth through the portal.",
			"%TARGET% gags slightly as the cock pushes deeper through the portal.",
			"%TARGET% trembles from the portal throat fucking.",
			"%TARGET% shudders in arousal from the oral portal penetration."
		)
		var/target_message = list(pick(arousal_messages))
		target.visible_message(span_lewd(replacetext(target_message, "%TARGET%", target)))

/datum/interaction/lewd/portal/fuck_urethra
	name = "Portal Fuck (Urethra)"
	description = "Fuck their urethra through the portal dildo."
	message = list(
		"rams their cock into %TARGET%'s urethra through the portal dildo",
		"pounds into %TARGET%'s cockhole through the portal dildo",
		"thrusts deep into %TARGET%'s urethral opening through the portal dildo",
		"fucks %TARGET%'s urethra through the portal dildo"
	)
	user_messages = list(
		"You feel %TARGET%'s tight urethra squeezing around your cock through the portal",
		"The warmth of %TARGET%'s cockhole envelops your shaft through the portal",
		"You thrust deep into %TARGET%'s urethral passage through the portal dildo"
	)
	target_messages = list(
		"You feel %USER%'s cock pushing into your urethra through the portal panties",
		"%USER%'s shaft slides deep into your cockhole through the portal",
		"The warmth of %USER%'s cock fills your urethra through the portal"
	)

	hidden_message = list(
		"rams their cock into the portal dildo's urethra",
		"pounds into the portal dildo's cockhole",
		"thrusts deep into the portal dildo's urethral opening",
		"fucks the portal dildo's urethra"
	)
	hidden_user_messages = list(
		"You feel the tight urethra squeezing around your cock through the portal",
		"The warmth of the portal dildo's cockhole envelops your shaft",
		"You thrust deep into the portal dildo's urethral passage"
	)
	hidden_target_messages = list(
		"You feel a cock pushing into your urethra through the portal panties",
		"A shaft slides deep into your cockhole through the portal",
		"The warmth of a cock fills your urethra through the portal"
	)

	cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"%CUMMING% cums hard into %CAME_IN%'s urethra through the portal dildo",
			"%CUMMING% fills %CAME_IN%'s cockhole with their seed through the portal dildo",
			"%CUMMING% pumps their load deep into %CAME_IN%'s urethra through the portal dildo"
		),
		CLIMAX_POSITION_TARGET = list(
			"%CUMMING%'s urethra squeezes tightly around %CAME_IN%'s cock as they cum through the portal",
			"%CUMMING% climaxes hard on %CAME_IN%'s shaft through the portal",
			"%CUMMING%'s cockhole contracts in orgasm around %CAME_IN%'s member through the portal"
		)
	)
	cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard into %CAME_IN%'s urethra through the portal dildo",
			"You fill %CAME_IN%'s cockhole with your seed through the portal dildo",
			"You pump your load deep into %CAME_IN%'s urethra through the portal dildo"
		),
		CLIMAX_POSITION_TARGET = list(
			"Your urethra squeezes tightly around %CAME_IN%'s cock as you cum through the portal",
			"You climax hard on %CAME_IN%'s shaft through the portal",
			"Your cockhole contracts in orgasm around %CAME_IN%'s member through the portal"
		)
	)
	cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel %CUMMING%'s hot seed flooding your urethra through the portal panties",
			"%CUMMING% fills your cockhole with their cum through the portal panties",
			"Your urethra is filled with %CUMMING%'s warm cum through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel %CUMMING%'s urethra squeeze around your cock as they cum through the portal",
			"%CUMMING% climaxes on your shaft through the portal dildo",
			"The portal dildo's cockhole contracts around your member as %CUMMING% cums"
		)
	)

	hidden_cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"cums hard into the portal dildo's urethra",
			"fills the portal dildo's cockhole with their seed",
			"pumps their load deep into the portal dildo's urethra"
		),
		CLIMAX_POSITION_TARGET = list(
			"The portal panties' urethra squeezes tightly around the cock as they cum",
			"The wearer climaxes hard through the portal panties",
			"The portal panties' cockhole contracts in orgasm"
		)
	)
	hidden_cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard into the portal dildo's urethra",
			"You fill the portal dildo's cockhole with your seed",
			"You pump your load deep into the portal dildo's urethra"
		),
		CLIMAX_POSITION_TARGET = list(
			"Your urethra squeezes tightly around the cock as you cum through the portal",
			"You climax hard through the portal panties",
			"Your cockhole contracts in orgasm around the member through the portal"
		)
	)
	hidden_cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel hot seed flooding your urethra through the portal panties",
			"Warm cum fills your cockhole through the portal panties",
			"Your urethra is filled with cum through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel the urethra squeeze around your cock as they cum through the portal",
			"The portal dildo's user climaxes on your shaft",
			"The portal dildo's cockhole contracts around your member"
		)
	)

/datum/interaction/lewd/portal/fuck_urethra/post_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(prob(5 + target.arousal))
		var/list/arousal_messages = list(
			"%TARGET% moans as their urethra is fucked through the portal.",
			"%TARGET% gasps as the cock pushes deeper into their cockhole through the portal.",
			"%TARGET% trembles from the portal urethral fucking.",
			"%TARGET% shudders in arousal from the urethral portal penetration."
		)
		var/target_message = list(pick(arousal_messages))
		target.visible_message(span_lewd(replacetext(target_message, "%TARGET%", target)))

/datum/interaction/lewd/portal/vaginal_ride
	name = "Portal Vaginal Ride"
	description = "Ride the portal dildo with your vagina."
	message = list(
		"rides %TARGET%'s cock with their pussy through the portal dildo",
		"bounces their vagina on %TARGET%'s shaft through the portal dildo",
		"grinds their pussy against %TARGET%'s member through the portal dildo",
		"impales their vagina on %TARGET%'s cock through the portal dildo"
	)
	user_messages = list(
		"You feel %TARGET%'s cock filling your pussy through the portal",
		"The warmth of %TARGET%'s shaft spreads through your vagina via the portal",
		"You grind your pussy against %TARGET%'s member through the portal dildo"
	)
	target_messages = list(
		"You feel your cock sliding into %USER%'s pussy through the portal panties",
		"%USER%'s vagina squeezes around your shaft through the portal",
		"The warmth of %USER%'s pussy envelops your cock through the portal"
	)

	hidden_message = list(
		"rides a cock with their pussy through the portal dildo",
		"bounces their vagina on a shaft through the portal dildo",
		"grinds their pussy against a member through the portal dildo",
		"impales their vagina on a cock through the portal dildo"
	)
	hidden_user_messages = list(
		"You feel a cock filling your pussy through the portal",
		"The warmth of a shaft spreads through your vagina via the portal",
		"You grind your pussy against a member through the portal dildo"
	)
	hidden_target_messages = list(
		"You feel your cock sliding into a pussy through the portal panties",
		"A vagina squeezes around your shaft through the portal",
		"The warmth of a pussy envelops your cock through the portal"
	)

	cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"%CUMMING% cums hard as their pussy is filled through the portal dildo",
			"%CUMMING% climaxes while riding the cock through the portal dildo",
			"%CUMMING%'s vagina squeezes tightly as they orgasm through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"%CUMMING% fills %CAME_IN%'s pussy with their seed through the portal dildo",
			"%CUMMING% pumps their load deep into %CAME_IN%'s vagina through the portal dildo",
			"%CUMMING% cums hard inside %CAME_IN%'s pussy through the portal"
		)
	)
	cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard as your pussy is filled through the portal dildo",
			"You climax while riding the cock through the portal dildo",
			"Your vagina squeezes tightly as you orgasm through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You fill %CAME_IN%'s pussy with your seed through the portal dildo",
			"You pump your load deep into %CAME_IN%'s vagina through the portal dildo",
			"You cum hard inside %CAME_IN%'s pussy through the portal"
		)
	)
	cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel %CUMMING%'s pussy squeeze around your cock as they cum through the portal",
			"%CUMMING% climaxes on your shaft through the portal dildo",
			"The portal dildo's pussy contracts around your member as %CUMMING% cums"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel %CUMMING%'s hot seed flooding your pussy through the portal panties",
			"%CUMMING% fills your vagina with their cum through the portal panties",
			"Your pussy is filled with %CUMMING%'s warm cum through the portal"
		)
	)

/datum/interaction/lewd/portal/anal_ride
	name = "Portal Anal Ride"
	description = "Ride the portal dildo with your ass."
	message = list(
		"rides %TARGET%'s cock with their ass through the portal dildo",
		"bounces their anus on %TARGET%'s shaft through the portal dildo",
		"grinds their ass against %TARGET%'s member through the portal dildo",
		"impales their anus on %TARGET%'s cock through the portal dildo"
	)
	user_messages = list(
		"You feel %TARGET%'s cock filling your ass through the portal",
		"The warmth of %TARGET%'s shaft spreads through your anus via the portal",
		"You grind your ass against %TARGET%'s member through the portal dildo"
	)
	target_messages = list(
		"You feel your cock sliding into %USER%'s ass through the portal panties",
		"%USER%'s anus squeezes around your shaft through the portal",
		"The warmth of %USER%'s ass envelops your cock through the portal"
	)

	hidden_message = list(
		"rides a cock with their ass through the portal dildo",
		"bounces their anus on a shaft through the portal dildo",
		"grinds their ass against a member through the portal dildo",
		"impales their anus on a cock through the portal dildo"
	)
	hidden_user_messages = list(
		"You feel a cock filling your ass through the portal",
		"The warmth of a shaft spreads through your anus via the portal",
		"You grind your ass against a member through the portal dildo"
	)
	hidden_target_messages = list(
		"You feel your cock sliding into an ass through the portal panties",
		"An anus squeezes around your shaft through the portal",
		"The warmth of an ass envelops your cock through the portal"
	)

	cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"%CUMMING% cums hard as their ass is filled through the portal dildo",
			"%CUMMING% climaxes while riding the cock through the portal dildo",
			"%CUMMING%'s anus squeezes tightly as they orgasm through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"%CUMMING% fills %CAME_IN%'s ass with their seed through the portal dildo",
			"%CUMMING% pumps their load deep into %CAME_IN%'s anus through the portal dildo",
			"%CUMMING% cums hard inside %CAME_IN%'s ass through the portal"
		)
	)
	cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard as your ass is filled through the portal dildo",
			"You climax while riding the cock through the portal dildo",
			"Your anus squeezes tightly as you orgasm through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You fill %CAME_IN%'s ass with your seed through the portal dildo",
			"You pump your load deep into %CAME_IN%'s anus through the portal dildo",
			"You cum hard inside %CAME_IN%'s ass through the portal"
		)
	)
	cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel %CUMMING%'s ass squeeze around your cock as they cum through the portal",
			"%CUMMING% climaxes on your shaft through the portal dildo",
			"The portal dildo's ass contracts around your member as %CUMMING% cums"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel %CUMMING%'s hot seed flooding your ass through the portal panties",
			"%CUMMING% fills your anus with their cum through the portal panties",
			"Your ass is filled with %CUMMING%'s warm cum through the portal"
		)
	)

/datum/interaction/lewd/portal/urethral_ride
	name = "Portal Urethral Ride"
	description = "Let them fuck your urethra through the portal dildo."
	message = list(
		"takes %TARGET%'s cock into their urethra through the portal dildo",
		"rides %TARGET%'s shaft with their cockhole through the portal dildo",
		"lets %TARGET% penetrate their urethra through the portal dildo",
		"gets their cockhole fucked by %TARGET% through the portal dildo"
	)
	user_messages = list(
		"You feel %TARGET%'s cock sliding into your urethra through the portal",
		"The warmth of %TARGET%'s shaft fills your cockhole through the portal",
		"You let %TARGET% penetrate your urethra through the portal dildo"
	)
	target_messages = list(
		"You feel your cock sliding into %USER%'s urethra through the portal panties",
		"%USER%'s cockhole squeezes around your shaft through the portal",
		"The warmth of %USER%'s urethra envelops your cock through the portal"
	)

	hidden_message = list(
		"takes a cock into their urethra through the portal dildo",
		"rides a shaft with their cockhole through the portal dildo",
		"lets someone penetrate their urethra through the portal dildo",
		"gets their cockhole fucked through the portal dildo"
	)
	hidden_user_messages = list(
		"You feel a cock sliding into your urethra through the portal",
		"The warmth of a shaft fills your cockhole through the portal",
		"You let someone penetrate your urethra through the portal dildo"
	)
	hidden_target_messages = list(
		"You feel your cock sliding into a urethra through the portal panties",
		"A cockhole squeezes around your shaft through the portal",
		"The warmth of a urethra envelops your cock through the portal"
	)

	cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"%CUMMING% cums hard as their urethra is filled through the portal dildo",
			"%CUMMING% shoots their seed while their cockhole is penetrated through the portal dildo",
			"%CUMMING% climaxes from the urethral penetration through the portal dildo"
		),
		CLIMAX_POSITION_TARGET = list(
			"%CUMMING% fills %CAME_IN%'s urethra with their seed through the portal dildo",
			"%CUMMING% pumps their load deep into %CAME_IN%'s cockhole through the portal dildo",
			"%CUMMING% cums hard inside %CAME_IN%'s urethra through the portal dildo"
		)
	)

	hidden_cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"cums hard as their urethra is filled through the portal dildo",
			"shoots their seed while their cockhole is penetrated through the portal dildo",
			"climaxes from the urethral penetration through the portal dildo"
		),
		CLIMAX_POSITION_TARGET = list(
			"fills the portal dildo's urethra with their seed",
			"pumps their load deep into the portal dildo's cockhole",
			"cums hard inside the portal dildo's urethra"
		)
	)

	hidden_cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard as your urethra is filled through the portal dildo",
			"You shoot your seed while your cockhole is penetrated through the portal dildo",
			"You climax from the urethral penetration through the portal dildo"
		),
		CLIMAX_POSITION_TARGET = list(
			"You fill the portal dildo's urethra with your seed",
			"You pump your load deep into the portal dildo's cockhole",
			"You cum hard inside the portal dildo's urethra"
		)
	)

	hidden_cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel hot seed flooding your urethra through the portal panties",
			"Warm cum fills your cockhole through the portal panties",
			"Your urethra is filled with cum through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel the urethra squeeze around your cock as they cum through the portal",
			"The portal dildo's user climaxes on your shaft",
			"The portal dildo's cockhole contracts around your member"
		)
	)

/datum/interaction/lewd/portal/urethral_ride/post_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(prob(5 + user.arousal))
		var/list/arousal_messages = list(
			"%USER% moans as they ride with their urethra through the portal.",
			"%USER% gasps as their cockhole is penetrated deeper through the portal.",
			"%USER% trembles from the portal urethral penetration.",
			"%USER% shudders in arousal as their urethra is filled through the portal."
		)
		var/target_message = list(pick(arousal_messages))
		user.visible_message(span_lewd(replacetext(target_message, "%USER%", user)))



/datum/interaction/lewd/portal/frotting
	name = "Portal Frotting"
	description = "Rub your cock against theirs through the portal dildo."
	message = list(
		"rubs their cock against %TARGET%'s penis through the portal dildo",
		"grinds their shaft against %TARGET%'s member through the portal dildo",
		"presses their dick against %TARGET%'s cock through the portal dildo",
		"frotts against %TARGET%'s penis through the portal dildo"
	)
	user_messages = list(
		"You feel %TARGET%'s cock rubbing against yours through the portal",
		"The warmth of %TARGET%'s shaft presses against your cock through the portal",
		"You grind your penis against %TARGET%'s through the portal dildo"
	)
	target_messages = list(
		"You feel %USER%'s cock rubbing against yours through the portal panties",
		"%USER%'s shaft grinds against your penis through the portal",
		"The warmth of %USER%'s cock presses against yours through the portal"
	)

	hidden_message = list(
		"rubs their cock against the portal dildo's penis",
		"grinds their shaft against the portal dildo's member",
		"presses their dick against the portal dildo's cock",
		"frotts against the portal dildo's penis"
	)
	hidden_user_messages = list(
		"You feel another cock rubbing against yours through the portal",
		"The warmth of another shaft presses against your cock through the portal",
		"You grind your penis against another through the portal dildo"
	)
	hidden_target_messages = list(
		"You feel a cock rubbing against yours through the portal panties",
		"A shaft grinds against your penis through the portal",
		"The warmth of another cock presses against yours through the portal"
	)

	cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"%CUMMING% cums hard against %CAME_IN%'s cock through the portal dildo",
			"%CUMMING% shoots their seed over %CAME_IN%'s shaft through the portal dildo",
			"%CUMMING% climaxes against %CAME_IN%'s penis through the portal dildo"
		),
		CLIMAX_POSITION_TARGET = list(
			"%CUMMING%'s cock throbs against %CAME_IN%'s shaft as they cum through the portal",
			"%CUMMING% climaxes hard against %CAME_IN%'s member through the portal",
			"%CUMMING%'s penis pulses in orgasm against %CAME_IN%'s cock through the portal"
		)
	)
	cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard against %CAME_IN%'s cock through the portal dildo",
			"You shoot your seed over %CAME_IN%'s shaft through the portal dildo",
			"You climax against %CAME_IN%'s penis through the portal dildo"
		),
		CLIMAX_POSITION_TARGET = list(
			"Your cock throbs against %CAME_IN%'s shaft as you cum through the portal",
			"You climax hard against %CAME_IN%'s member through the portal",
			"Your penis pulses in orgasm against %CAME_IN%'s cock through the portal"
		)
	)
	cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel %CUMMING%'s hot seed splashing against your cock through the portal panties",
			"%CUMMING% covers your shaft with their cum through the portal panties",
			"Your penis is coated with %CUMMING%'s warm cum through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel %CUMMING%'s cock throb against yours as they cum through the portal",
			"%CUMMING% climaxes against your shaft through the portal dildo",
			"The portal dildo's penis pulses against your member as %CUMMING% cums"
		)
	)

	hidden_cum_message_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"cums hard against the portal dildo's cock",
			"shoots their seed over the portal dildo's shaft",
			"climaxes against the portal dildo's penis"
		),
		CLIMAX_POSITION_TARGET = list(
			"The portal panties' cock throbs against the shaft as they cum",
			"The wearer climaxes hard through the portal panties",
			"The portal panties' penis pulses in orgasm"
		)
	)
	hidden_cum_self_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You cum hard against the portal dildo's cock",
			"You shoot your seed over the portal dildo's shaft",
			"You climax against the portal dildo's penis"
		),
		CLIMAX_POSITION_TARGET = list(
			"Your cock throbs against the shaft as you cum through the portal",
			"You climax hard through the portal panties",
			"Your penis pulses in orgasm against the member through the portal"
		)
	)
	hidden_cum_partner_text_overrides = list(
		CLIMAX_POSITION_USER = list(
			"You feel hot seed splashing against your cock through the portal panties",
			"Warm cum covers your shaft through the portal panties",
			"Your penis is coated with cum through the portal"
		),
		CLIMAX_POSITION_TARGET = list(
			"You feel the cock throb against yours as they cum through the portal",
			"The portal dildo's user climaxes against your shaft",
			"The portal dildo's penis pulses against your member"
		)
	)

/datum/interaction/lewd/portal/frotting/post_interaction(mob/living/user, mob/living/target)
	. = ..()
	if(prob(5 + target.arousal))
		var/list/arousal_messages = list(
			"%TARGET% moans as their cock is rubbed through the portal.",
			"%TARGET% gasps as the shaft grinds against theirs through the portal.",
			"%TARGET% trembles from the portal frotting.",
			"%TARGET% shudders in arousal from the cock-to-cock contact through the portal."
		)
		var/target_message = list(pick(arousal_messages))
		target.visible_message(span_lewd(replacetext(target_message, "%TARGET%", target)))


/datum/interaction/lewd/portal/tribadism
	name = "Portal Tribadism"
	description = "Grind your pussy against theirs through the portal."
	message = list(
		"grinds their pussy against %TARGET%'s cunt through the portal fleshlight",
		"rubs their cunt against %TARGET%'s pussy through the portal fleshlight",
		"thrusts against %TARGET%'s pussy through the portal fleshlight",
		"humps %TARGET%, their pussies grinding together through the portal fleshlight"
	)
	user_messages = list(
		"You feel %TARGET%'s pussy grinding against yours through the portal",
		"The warmth of %TARGET%'s cunt rubs against your own through the portal",
		"You work your pussy against %TARGET%'s through the portal fleshlight"
	)
	target_messages = list(
		"You feel %USER%'s pussy grinding against yours through the portal panties",
		"%USER%'s cunt rubs against your own through the portal",
		"%USER%'s pussy works against yours through the portal"
	)

	hidden_message = list(
		"grinds their pussy against the portal fleshlight's cunt",
		"rubs their cunt against the portal fleshlight's pussy",
		"thrusts against the portal fleshlight's pussy",
		"humps the portal fleshlight, grinding against it"
	)
	hidden_user_messages = list(
		"You feel a pussy grinding against yours through the portal",
		"The warmth of a cunt rubs against your own through the portal",
		"You work your pussy against another through the portal fleshlight"
	)
	hidden_target_messages = list(
		"You feel a pussy grinding against yours through the portal panties",
		"A cunt rubs against your own through the portal",
		"A pussy works against yours through the portal"
	)



