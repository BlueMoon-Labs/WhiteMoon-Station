// #define STORYTELLER_HISTORY_FILE "data/storyteller_history.json"

// /datum/controller/subsystem/persistence
// 	var/list/storyteller_history = list()

// /datum/controller/subsystem/persistence/proc/load_storyteller_history()
// 	if(fexists(STORYTELLER_HISTORY_FILE))
// 		var/list/history = json_decode(file2text(STORYTELLER_HISTORY_FILE))
// 		if(islist(history))
// 			storyteller_history = history

// /datum/controller/subsystem/persistence/proc/save_storyteller_history()
// 	if(islist(storyteller_history))
// 		var/json = json_encode(storyteller_history)
// 		var/file = file(STORYTELLER_HISTORY_FILE)
// 		fdel(file)
// 		WRITE_FILE(file, json)
