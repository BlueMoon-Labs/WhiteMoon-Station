/proc/toggle_permit_pins()
	GLOB.permit_pin_unrestricted = !GLOB.permit_pin_unrestricted
	minor_announce("Разрешения бойков [GLOB.permit_pin_unrestricted ? "удалены" : "восстановлены"].", "Обновление Систем Вооружения:")
	SSblackbox.record_feedback("nested tally", "keycard_auths", 1, list("permit-locked pins", GLOB.permit_pin_unrestricted ? "unlocked" : "locked"))
