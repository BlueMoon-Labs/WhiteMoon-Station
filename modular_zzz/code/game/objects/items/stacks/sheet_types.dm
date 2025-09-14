GLOBAL_LIST_INIT(white_crates_recipes, list ( \
	new /datum/stack_recipe_list("crates", list( \
		new/datum/stack_recipe("crate", /obj/structure/closet/crate, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("trash cart", /obj/structure/closet/crate/trashcart, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("internals crate", /obj/structure/closet/crate/internals, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("freezer", /obj/structure/closet/crate/freezer, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("cargo crate", /obj/structure/closet/crate/cargo, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("mining crate", /obj/structure/closet/crate/cargo/mining, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("centcom crate", /obj/structure/closet/crate/centcom, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("hydroponics crate", /obj/structure/closet/crate/hydroponics, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("department medical crate", /obj/structure/closet/crate/medical/department, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("radiation crate", /obj/structure/closet/crate/radiation, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("engineering crate", /obj/structure/closet/crate/engineering, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("electrical crate", /obj/structure/closet/crate/engineering/electrical, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("atmospherics crate", /obj/structure/closet/crate/engineering/atmos, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("science crate", /obj/structure/closet/crate/science, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
		new/datum/stack_recipe("robotics crate", /obj/structure/closet/crate/science/robo, 5, time = 3 SECONDS, crafting_flags = CRAFT_CHECK_DENSITY | CRAFT_ONE_PER_TURF | CRAFT_ON_SOLID_GROUND, category = CAT_FURNITURE),
	)),
))

/obj/item/stack/sheet/plasteel/get_main_recipes()
	. = ..()
	. += GLOB.white_crates_recipes
