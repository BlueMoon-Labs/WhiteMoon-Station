// Taken from Modular Vending in Bubbers
// All entries will become null after Initialize, to free up memory.

/obj/machinery/vending
	// Additions to the `products` list
	var/list/zzz_products
	// Additions to the `product_categories` list
	var/list/zzz_product_categories
	// Additions to the `premium` list
	var/list/zzz_premium
	// Additions to the `contraband` list
	var/list/zzz_contraband

/obj/machinery/vending/Initialize(mapload)
	if(zzz_products)
		// We need this, because duplicates screw up the spritesheet!
		for(var/item_to_add in zzz_products)
			products[item_to_add] = zzz_products[item_to_add]

	if(zzz_product_categories)
		for(var/category in zzz_product_categories)
			var/already_exists = FALSE
			for(var/existing_category in product_categories)
				if(existing_category["name"] == category["name"])
					existing_category["products"] += category["products"]
					already_exists = TRUE
					break

			if(!already_exists)
				product_categories += category

	if(zzz_premium)
		// We need this, because duplicates screw up the spritesheet!
		for(var/item_to_add in zzz_premium)
			premium[item_to_add] = zzz_premium[item_to_add]

	if(zzz_contraband)
		// We need this, because duplicates screw up the spritesheet!
		for(var/item_to_add in zzz_contraband)
			contraband[item_to_add] = zzz_contraband[item_to_add]

	zzz_products = null
	zzz_product_categories = null
	zzz_premium = null
	zzz_contraband = null
	return ..()
