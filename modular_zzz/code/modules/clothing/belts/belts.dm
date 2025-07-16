/obj/item/storage/belt/security/webbing/elite_chestrig
	name = "Elite Combat Tactical Chest-Rig"
	desc = "A no-nonsense, battle-proven rig designed for operators who prefer their gear rugged, modular, and drenched in the faint smell of gun oil and bad decisions. This hybrid harness combines MOLLE precision with ALICE simplicity—because when you're knee-deep in a maintenance tunnel brawl, you don’t have time to admire your own loadout. The worn leather holster on the hip suggests a previous owner who believed in ‘shoot first, file paperwork never.’"
	icon = 'modular_zzz/icons/obj/clothing/belts.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/belts.dmi'
	icon_state = "elite_chestrig"
	worn_icon_state = "elite_chestrig"

/obj/item/storage/belt/sabre/kazeshini
	name = "Kazeshini Sheath"
	desc = "Another artifact in the form of a katana. The blade was found during one expedition group. The blade constantly burns with a blue flame, this flame, as experiments have shown, cannot be extinguished, does not burn to the touch. The blade is forged from an unknown alloy of materials, the blade is not subject to damage and temperature loads."
	icon = 'modular_zzz/icons/obj/clothing/belts.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/belts.dmi'
	lefthand_file = 'modular_zzz/icons/mob/clothing/lefthand.dmi'
	righthand_file = 'modular_zzz/icons/mob/clothing/righthand.dmi'

/obj/item/storage/belt/sabre/kazeshini/PopulateContents()
	new /obj/item/melee/sabre/kazeshini(src)
	update_appearance()

/obj/item/storage/belt/sabre/cargo/kazeshini
	name = "Kazeshini Sheath"
	desc = "Another artifact in the form of a katana. The blade was found during one expedition group. The blade constantly burns with a blue flame, this flame, as experiments have shown, cannot be extinguished, does not burn to the touch. The blade is forged from an unknown alloy of materials, the blade is not subject to damage and temperature loads."
	icon = 'modular_zzz/icons/obj/clothing/belts.dmi'
	worn_icon = 'modular_zzz/icons/mob/clothing/belts.dmi'
	lefthand_file = 'modular_zzz/icons/mob/clothing/lefthand.dmi'
	righthand_file = 'modular_zzz/icons/mob/clothing/righthand.dmi'

/obj/item/storage/belt/sabre/cargo/kazeshini/PopulateContents()
	new /obj/item/melee/sabre/cargo/kazeshini(src)
	update_appearance()
