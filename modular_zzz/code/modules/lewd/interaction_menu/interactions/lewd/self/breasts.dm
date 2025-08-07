/datum/interaction/lewd/titgrope_self
	name = "Грудь: поласкать (Собственную)"
	description = "Ухватитесь за собственную грудь."
	message = list(
		"мягко обхватывает рукой свою грудь.",
		"несильно сжимает свои груди.",
		"ухватывается за свою грудь.",
		"проходится по соскам своими пальцами.",
		"дразнит пальцами себя и свои соски.",
		"аккуратно касается собственных грудей."
	)

/datum/interaction/lewd/titgrope_self/post_interaction(mob/living/carbon/human/user, mob/living/carbon/human/target)
	. = ..()
	if(!ishuman(user))
		return
	if(prob(5 + user.arousal))
		user.visible_message(span_lewd("<b>[user]</b> [pick(
			"дрожит в возбуждении.",
			"тихонечко постанывает.",
			"выдыхает мягкий стон.",
			"открывает рот в стоне.",
			"мягко вздрагивает.",
			"продрагивает от касания собственной руки.")]"))

	var/obj/item/liquid_container
	var/obj/item/cached_item = user.get_active_held_item()
	if(istype(cached_item) && cached_item.is_refillable() && cached_item.is_drainable())
		liquid_container = cached_item
	else
		cached_item = user.pulling
		if(istype(cached_item) && cached_item.is_refillable() && cached_item.is_drainable())
			liquid_container = cached_item

	if(liquid_container)
		var/obj/item/organ/genital/breasts/breasts = user.get_organ_slot(ORGAN_SLOT_BREASTS)
		if(breasts?.internal_fluid_datum)
			// Calculate milk amount based on how full the breasts are (0.5 to 2 multiplier)
			var/milk_multiplier = 0.5
			if(breasts.internal_fluid_maximum > 0)
				milk_multiplier = 0.5 + (1.5 * (breasts.internal_fluid_count / breasts.internal_fluid_maximum))

			var/transfer_amount = rand(1, 3 * milk_multiplier)
			var/datum/reagents/R = new(breasts.internal_fluid_maximum)
			breasts.transfer_internal_fluid(R, transfer_amount)
			R.trans_to(liquid_container, R.total_volume)
			qdel(R)

/datum/interaction/lewd/self_nipsuck
	name = "Соски: пососать (Собственные)"
	description = "Обласкайте языком и обсосите собственне соски."
	message = list(
		"\"берёт\" у себя молочко, присасываясь к собственным грудям.",
		"пьёт из собственных грудей парное молоко.",
		"наполняет свой рот большим глотком своего горячего молока."
	)

/datum/interaction/lewd/breastfuck_self
	name = "Груди: ублажить (Себя)"
	description = "Воспользуйтесь своими грудями по прямому сексуальному назначению."
	cum_message_text_overrides = list(CLIMAX_POSITION_USER = list(
		"кончает поверх собственных грудей.",
		"стреляет семенем поверх своих сисек.",
		"покрывает свои соски горячим семенем."
	))
	cum_self_text_overrides = list(CLIMAX_POSITION_USER = list(
		"Вы кончаете поверх собственных грудей.",
		"Вы стреляете семенем поверх своих сисек.",
		"Вы покрываете свои соски горячим семенем."
	))
	message = list(
		"трахает собственные груди членом.",
		"скользит своим членом между собственных грудей.",
		"опускает и поднимает свои груди, обтирая ими свой член.",
		"прикусывает губу в наслаждении, тазом проникая между собственными же грудями."
	)
