/// ADD ANDROMEDA-13 (@ms_kira): Перевод, дополнение ЕРП контента.
/// Взято из PR #6 билда Андромеда-13
/datum/interaction/lewd/grindface
	name = "Ноги: прижать к лицу"
	description = "Прижмите чье-нибудь лицо своей ножкой."
	message = list(
		"размашисто проходится своей %FEET% по лицу %TARGET%.",
		"сильно жмется своей %FEET% к лицу %TARGET%.",
		"натирается своей %FEET% о лицо %TARGET%.",
		"кладет свою %FEET% прямо на лицо %TARGET%.",
		"кладет свою %FEET% на лицо %TARGET% и сильно давит.",
		"резко кладет свою %FEET% на лицо %TARGET%."
	)

/datum/interaction/lewd/grindface/act(mob/living/user, mob/living/target)
	var/list/original_messages = message.Copy()
	// Get shoes or barefoot text
	// В обуви или босой ногой
	var/obj/item/clothing/shoes/worn_shoes = user.get_item_by_slot(ITEM_SLOT_FEET)
	var/feet_text = worn_shoes?.name || pick("босые ноги", "подошвы")

	var/chosen_message = pick(message)
	chosen_message = replacetext(chosen_message, "%FEET%", feet_text)
	message = list(chosen_message)
	. = ..()
	message = original_messages

/datum/interaction/lewd/grindmouth
	name = "Ноги: полезть в рот партнёра"
	description = "Пройдитесь своей ногой кому-нибудь в рот."
	message = list(
		"грубо пихает свою %FEET% глубже в рот %TARGET%.",
		"грубо заталкивает еще один дюйм своей %FEET% в ротик %TARGET%.",
		"давит свои весом, проталкивая свою %FEET% глубже в ротик %TARGET%.",
		"заталкивает свою %FEET% глубоко в рот %TARGET%.",
		"прижимает кончик своей %FEET% к губам %TARGET% и надавливает во-внутрь.",
		"готовится и одним быстрым движением засовывает свою %FEET% глубоко в ротик %TARGET%."
	)

/datum/interaction/lewd/grindmouth/act(mob/living/user, mob/living/target)
	var/list/original_messages = message.Copy()
	var/obj/item/clothing/shoes/worn_shoes = user.get_item_by_slot(ITEM_SLOT_FEET)
	var/feet_text = worn_shoes?.name || pick("босые ноги", "пальцы", "подошвы")

	var/chosen_message = pick(message)
	chosen_message = replacetext(chosen_message, "%FEET%", feet_text)
	message = list(chosen_message)
	. = ..()
	message = original_messages

/datum/interaction/lewd/footjob
	name = "Ноги: ублажить партнёра (Footjob)"
	description = "Вздрочните кому-нибудь своей ножкой."
	message = list(
		"Дрочит член %TARGET% используя свою %FEET%.",
		"Трется своей %FEET% о ствол %TARGET%.",
		"Работает своей %FEET% вверх и вниз на пенисе %TARGET%."
	)
	cum_message_text_overrides = list(
		CLIMAX_POSITION_TARGET = list(
			"Кончает по всей %FEET% %USER% своим семенем.",
			"Покрывает %FEET% %USER% в своем смени.",
			"Выпрыскивает все соки прямо на %FEET% %USER%."
		)
	)
	cum_self_text_overrides = list(
		CLIMAX_POSITION_TARGET = list(
			"Вы кончаете по всей %FEET% %USER% своим семенем.",
			"Вы покрываете семенем всю %FEET% %USER%.",
			"Вы выпрыскиваете все свои соки прямо на %FEET% %USER%."
		)
	)
	cum_partner_text_overrides = list(
		CLIMAX_POSITION_TARGET = list(
			"%TARGET% Обильно кончает прямо на вашу %FEET%.",
			"%TARGET% Покрывает вашу %FEET% своим семенем.",
			"%TARGET% Выстреливает все что есть на вашу %FEET%."
		)
	)

/datum/interaction/lewd/footjob/act(mob/living/user, mob/living/target)
	var/list/original_messages = message.Copy()
	var/obj/item/clothing/shoes/worn_shoes = user.get_item_by_slot(ITEM_SLOT_FEET)
	var/feet_text = worn_shoes?.name || pick("ножка", "подошвы")

	var/chosen_message = pick(message)
	chosen_message = replacetext(chosen_message, "%FEET%", feet_text)
	message = list(chosen_message)
	. = ..()
	message = original_messages

/datum/interaction/lewd/footjob/show_climax(mob/living/cumming, mob/living/came_in, position)
	var/obj/item/clothing/shoes/worn_shoes = cumming.get_item_by_slot(ITEM_SLOT_FEET)
	var/feet_text = worn_shoes?.name || pick("ножка", "подошвы")

	// Store original lists, with null checks
	var/list/original_message_overrides = cum_message_text_overrides[position]
	var/list/original_self_overrides = cum_self_text_overrides[position]
	var/list/original_partner_overrides = cum_partner_text_overrides[position]
	original_message_overrides = original_message_overrides?.Copy()
	original_self_overrides = original_self_overrides?.Copy()
	original_partner_overrides = original_partner_overrides?.Copy()

	// Pick and modify one message from each list
	var/message_override = replacetext(pick(cum_message_text_overrides[position]), "%FEET%", feet_text)
	var/self_override = replacetext(pick(cum_self_text_overrides[position]), "%FEET%", feet_text)
	var/partner_override = replacetext(pick(cum_partner_text_overrides[position]), "%FEET%", feet_text)

	// Set single message lists
	cum_message_text_overrides[position] = list(message_override)
	cum_self_text_overrides[position] = list(self_override)
	cum_partner_text_overrides[position] = list(partner_override)

	. = ..()

	// Restore original lists
	cum_message_text_overrides[position] = original_message_overrides
	cum_self_text_overrides[position] = original_self_overrides
	cum_partner_text_overrides[position] = original_partner_overrides

/datum/interaction/lewd/footjob/double
	name = "Ноги: ублажить партнёра двумя ногами"
	description = "Вздрочните кому-нибудь своими ножками."
	message = list(
		"вздрачивает член %TARGET% своими %FEET%.",
		"надрачивает пушку %TARGET% используя свои %FEET%.",
		"играется с членом %TARGET% задействуя %FEET%.",
		"небрежно обводит письку %TARGET% своими %FEET%.",
		"трется своими %FEET% о пенис %TARGET%.",
		"работает двумя своими %FEET% вверх-вниз, заглаживая член %TARGET%."
	)

/datum/interaction/lewd/footjob/double/act(mob/living/user, mob/living/target)
	var/list/original_messages = message.Copy()
	var/obj/item/clothing/shoes/worn_shoes = user.get_item_by_slot(ITEM_SLOT_FEET)
	var/feet_text = worn_shoes?.name || "ножка"

	var/chosen_message = pick(message)
	chosen_message = replacetext(chosen_message, "%FEET%", feet_text)
	message = list(chosen_message)
	. = ..()
	message = original_messages

/datum/interaction/lewd/footjob/vagina
	name = "Ноги: ублажить киску"
	description = "Поработайте своей ножкой с чьей-нибудь вагиной."
	message = list(
		"трет клитор %TARGET% используя свою %FEET%.",
		"трется своей %FEET% о целку %TARGET%.",
		"трется своей %FEET% о киску %TARGET%.",
		"натирает своей %FEET% киску %TARGET%.",
		"давит своей %FEET% киску %TARGET%, попутно растирая её.",
		"слегка толкается своей %FEET% в киску %TARGET%, прижимая ту.",
		"трет своей %FEET% вверх-вниз по кисе %TARGET%."
	)
	cum_message_text_overrides = list(
		CLIMAX_POSITION_TARGET = list(
			"%TARGET% сквиртует прямо на %FEET% %USER%.",
			"%TARGET% сквиртует на %FEET% %USER% запыхаясь.",
			"%TARGET% обильно сквиртит прямо на %FEET% %USER%.",
			"%TARGET% оргазмирует на %FEET% %USER%.",
			"%TARGET% обильно оргазмирует прямо на %FEET% %USER%.",
			"%TARGET% обильно покрывает %FEET% %USER% своими соками."
		)
	)
	cum_self_text_overrides = list(
		CLIMAX_POSITION_TARGET = list(
			"Вы неумолимо сквиртуете на %FEET% %USER%.",
			"Вы сквиртуете прямо на %FEET% %USER%.",
			"Вы протяжно оргазмируете на %FEET% %USER%.",
			"Вы сладко оргазмируете прямо на %FEET% %USER%.",
			"Вы тихонько и сжато стреляете соками на %FEET% %USER%.",
			"Вы обильно покрываете %FEET% %USER% вашими соками~."
		)
	)
	cum_partner_text_overrides = list(
		CLIMAX_POSITION_TARGET = list(
			"%TARGET% Обильно сквиртует на вашу %FEET%.",
			"%TARGET% Сквиртует на вашу %FEET%.",
			"%TARGET% Неумолимо сквиртует на вашу %FEET%.",
			"%TARGET% Сочно оргазмирует на вашу %FEET%.",
			"%TARGET% Слащаво и обильно оргазмирует на вашу %FEET%.",
			"%TARGET% Покрывает вашу %FEET% обильным количеством соков."
		)
	)
