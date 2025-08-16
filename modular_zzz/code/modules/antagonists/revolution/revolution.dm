/datum/revolution_handler
	var/list/accounts_to_rob

/datum/revolution_handler/check_rev_victory()
	if(world.time >= 10 MINUTES)
		accounts_to_rob = flatten_list(SSeconomy.bank_accounts_by_id)
		for(var/i in accounts_to_rob)
			var/datum/bank_account/B = i
			if(B && B.has_money(100))
				B.adjust_money(-100, "Сокращение финансового обеспечения: Nanotrasen.")
				B.bank_card_talk("Ваше финансовое обеспечение было сокращено на сто кредитов силами бухгалтеров Nanotrasen! Работайте лучше!")

		var/list/excluded_rank = list(JOB_HUMAN_AI, JOB_CYBORG, JOB_PERSONAL_AI, JOB_AI)
		for(var/datum/job/J in SSjob.all_occupations)
			if(J.title in excluded_rank)
				continue
			if(J.departments_bitflags & (DEPARTMENT_BITFLAG_COMMAND | DEPARTMENT_BITFLAG_CENTRAL_COMMAND))
				continue
			J.paycheck = round(J.paycheck * 0.5)	//halve the salary of all professions except leading
	. = ..()
