/datum/map_template/shuttle/pirate/inteq
	suffix = "inteq_colossus"
	name = "pirate ship (PMC InteQ)"

/datum/pirate_gang/inteq
	name = "PMC InteQ"

	is_heavy_threat = TRUE
	ship_template_id = "inteq_colossus"
	ship_name_pool = "imperial_names"

	threat_title = "Сомнительное Заявление"
	threat_content = "Джамбо, уроды. Это %SHIPNAME. Мы тут пролетали неподалеку и заметили голубков. Расклад прост. \
		Гоните %PAYOFF кредитов, в противном случае мы не поленимся проложить курс нашего крейсера напрямую через вашу станцию. \
		<br> \
		<br> \
		Центральное Командование сообщает: 'Это крупная угроза. СБ может не справиться. Ополчение не помешает'."
	arrival_announcement = "Те из вас, кто останутся в живых, будут завидовать мёртвым."
	possible_answers = list("Мы заплатим!","Игнорировать")

	response_received = "Удачного дня, рабы Корпорации."
	response_rejected = "Поговорим на языке силы."
	response_too_late = "Слишком поздно. Мы уже в пути."
	response_not_enough = "Здесь не хватает кредитов, козлы. Молитесь."
	announcement_color = "yellow"

/datum/outfit/pirate/inteq
	name = "PMC InteQ: Pirate"

	uniform = /obj/item/clothing/under/syndicate/inteq_honorable_vanguard
	head = /obj/item/clothing/head/HoS/inteq_vanguard
	mask = /obj/item/clothing/mask/balaclava/breath/inteq
	gloves = /obj/item/clothing/gloves/combat
	suit = /obj/item/clothing/suit/armor/inteq

	back = /obj/item/storage/backpack/duffelbag/syndie
	box = /obj/item/storage/box/survival/syndie
	glasses = /obj/item/clothing/glasses/hud/security/sunglasses/inteq
	l_pocket = /obj/item/extinguisher/mini
	r_pocket = /obj/item/tank/internals/emergency_oxygen/double

	cybernetic_implants = list(
		/obj/item/organ/cyberimp/eyes/hud/medical,
		/obj/item/organ/eyes/robotic/shield,
		/obj/item/organ/cyberimp/chest/nutriment/plus,
	)

	implants = list(/obj/item/implant/explosive, /obj/item/implant/weapons_auth)

/datum/outfit/pirate/inteq/warlord
	name = "PMC InteQ: Pirate Leader"
	id_trim = /datum/id_trim/pirate/captain
	head = /obj/item/clothing/head/HoS/inteq_honorable_vanguard
	suit = /obj/item/clothing/suit/armor/inteq/honorable_vanguard

/obj/effect/mob_spawn/ghost_role/human/pirate/inteq
	name = "\improper InteQ sleeper"
	desc = "Продвинутое Спальное Место, от которого несёт запахом железа."
	fluff_spawn = null
	you_are_text = "Ты был никем, пока тебе не дали возможность зарабатывать на убийствах. Если приложишь усилия, сможешь добиться успехов!"
	flavour_text = "Держитесь вместе и разграбьте станцию подчистую!"
	icon = 'icons/obj/machines/sleeper.dmi'
	icon_state = "sleeper_s"
	prompt_name = "a InteQ sleeper"
	outfit = /datum/outfit/pirate/inteq
	rank = "Mercenary"

/obj/effect/mob_spawn/ghost_role/human/pirate/inteq/warlord
	rank = "Vanguard"
	outfit = /datum/outfit/pirate/inteq/warlord

/obj/effect/mob_spawn/ghost_role/human/pirate/inteq/warlord/special(mob/living/carbon/spawned_mob)
	. = ..()
	spawned_mob.dna.add_mutation(/datum/mutation/hulk/superhuman, MUTATION_SOURCE_GHOST_ROLE)
	spawned_mob.dna.add_mutation(/datum/mutation/gigantism, MUTATION_SOURCE_GHOST_ROLE)

