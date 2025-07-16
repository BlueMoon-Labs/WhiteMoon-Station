/mob/get_status_tab_items()
	.=..()
	if(SSticker.current_state < GAME_STATE_PLAYING)
		return

	. += "Storyteller: [SSgamemode.storyteller.name]"
