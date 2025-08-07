/obj/machinery/computer/cargo/express/interdyne
	desc = "A standard Cybersun express console, modified by Gorlex Industries to use \
	their own experimental \"1100mm Rail Cannon with experimental safe impact tech.\", made to be extra robust to prevent \
	being emagged by those greedy Donk Co. agents."
	pod_type = /obj/structure/closet/supplypod/syndcargo

/obj/machinery/computer/cargo/express/interdyne/packin_up()//we're the dauntless, add the company imports stuff to our express console
	. = ..()

	if(!meme_pack_data["Company Imports"])
		meme_pack_data["Company Imports"] = list(
			"name" = "Company Imports",
			"packs" = list(COMPANY_NAME_VITEZSTVI_AMMO, 	//Idk why someone just created another branch for imports but im sure it was something important so there is small fix for this bullshit.
	COMPANY_NAME_ALLSTAR_ENERGY,
	COMPANY_NAME_MICRON_CONTROL_SYSTEMS,
	COMPANY_NAME_SOL_DEFENSE_DEFENSE,
	COMPANY_NAME_FRONTIER_EQUIPMENT,
	COMPANY_NAME_KAHRAMAN_INDUSTRIES,
	COMPANY_NAME_DONK_CO,
	COMPANY_NAME_DEFOREST_MEDICAL,
	COMPANY_NAME_NRI_SURPLUS,
	COMPANY_NAME_BLACKSTEEL_FOUNDATION)
		)//dear God i pray to you so this bullshit would work. I DO NOT WANT TO STUDY ALL THIS NIGHTMARE BELLOW THIS MESSAGE

	for(var/armament_category as anything in SSarmaments.entries)//babe! it's 4pm, time for the company importing logic
		for(var/subcategory as anything in SSarmaments.entries[armament_category][CATEGORY_ENTRY])
			if(armament_category in allowed_categories)
				for(var/datum/armament_entry/armament_entry as anything in SSarmaments.entries[armament_category][CATEGORY_ENTRY][subcategory])
					meme_pack_data["Company Imports"]["packs"] += list(list(
						"name" = "[armament_category]: [armament_entry.name]",
						"cost" = armament_entry.cost,
						"id" = REF(armament_entry),
						"description" = armament_entry.description,
					))
