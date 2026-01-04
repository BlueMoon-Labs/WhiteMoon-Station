/// Removes all the loot and achievements from megafauna for bitrunning related
/mob/living/simple_animal/hostile/megafauna/proc/make_virtual_megafauna()
	var/new_max = clamp(maxHealth * 0.5, 600, 1300)
	maxHealth = new_max
	health = new_max

	true_spawn = FALSE

	// WHITEMOON
	// Создаём новые списки вместо изменения кэшированных ссылок string_list()
	// что приводило к порче добычи для всей мегафауны этого типа во всем мире
	loot = list(/obj/structure/closet/crate/secure/bitrunning/encrypted)
	crusher_loot = list(/obj/structure/closet/crate/secure/bitrunning/encrypted)
