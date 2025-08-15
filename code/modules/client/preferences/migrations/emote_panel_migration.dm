/datum/preferences/proc/migrate_emote_panel()
	var/list/new_custom_emote_panel = list()
	for(var/emote_key in custom_emote_panel)
		var/emote_name = html_encode(custom_emote_panel[emote_key])
		if(!emote_name)
			continue
		// Если у игрока были эмоуты с одинаковыми названиями, но разными ключами, некоторые из них могут быть потеряны.
		// Но это уже проблемы игрока...
		new_custom_emote_panel[emote_name] = list("type" = TGUI_PANEL_EMOTE_TYPE_DEFAULT, "key" = emote_key)
	custom_emote_panel = new_custom_emote_panel
	return TRUE
