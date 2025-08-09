// когда мы тыкаем на молотов зажигалкой, мы хотим его поджечь, а не просто погреть жидкости внутри
/obj/item/reagent_containers/cup/glass/bottle/molotov/Initialize(mapload, vol)
	. = ..()
	RemoveElement(/datum/element/reagents_item_heatable)
