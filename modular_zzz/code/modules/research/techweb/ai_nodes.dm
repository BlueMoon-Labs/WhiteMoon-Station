 // ! WHITEMOON. Убрал возможность печатать платы смены законов, чтобы антагонисты не просто распечатали и пошли законы менять, а крали плату из хранилища.

/datum/techweb_node/ai/New()
	. = ..()
	design_ids -= "aiupload"

/datum/techweb_node/cybernetics/New()
	. = ..()
	design_ids -= "borgupload"

/datum/design/board/borgupload
	id = DESIGN_ID_IGNORE

/datum/design/board/aiupload
	id = DESIGN_ID_IGNORE
