/obj/effect/spawner/random/melee
	name = "Random Melee Weapon"
	desc = "This is a random melee weapon."
	icon_state = "esword_dual"
	spawn_loot_count = 3

/obj/effect/spawner/random/melee/New(loc, ...)
	. = ..()
	LAZYADD(loot, typesof(/obj/item/melee))
	LAZYADD(loot, typesof(/obj/item/knife))
	LAZYADD(loot, typesof(/obj/item/katana))
	LAZYADD(loot, typesof(/obj/item/dualsaber))
	LAZYADD(loot, typesof(/obj/item/spear))
