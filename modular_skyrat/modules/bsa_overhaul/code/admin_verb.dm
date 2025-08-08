ADMIN_VERB(toggle_bsa, R_ADMIN, "Toggle BSA Control", "Toggles the BSA control lock on and off.", ADMIN_CATEGORY_FUN)
	GLOB.bsa_unlock = !GLOB.bsa_unlock
	minor_announce("Протоколы Выстрелов из Блюспейс-Артиллерии были [GLOB.bsa_unlock? "разблокированы" : "заблокированы"]", "ВНИМАНИЕ: Блюспейс-Артиллерия")

	message_admins("[ADMIN_LOOKUPFLW(usr)] [GLOB.bsa_unlock? "unlocked" : "locked"] BSA firing protocols.")
	log_admin("[key_name(user)] [GLOB.bsa_unlock? "unlocked" : "locked"] BSA firing protocols.")
