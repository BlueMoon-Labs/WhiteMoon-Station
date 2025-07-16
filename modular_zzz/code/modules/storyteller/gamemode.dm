// /datum/controller/subsystem/gamemode/set_storyteller(passed_type, forced, force_ckey)
// 	if(storytellers[passed_type])
// 		var/datum/storyteller/story_pass = storytellers[passed_type]
// 		var/current_name = story_pass.name
// 		if(!islist(SSpersistence.storyteller_history))
// 			SSpersistence.storyteller_history = list()
// 		SSpersistence.storyteller_history += current_name
// 		while(length(SSpersistence.storyteller_history) > 3)
// 			SSpersistence.storyteller_history.Cut(1,2)
// 		if(length(SSpersistence.storyteller_history) == 3)
// 			var/last = SSpersistence.storyteller_history[1]
// 			if(SSpersistence.storyteller_history[2] == last && SSpersistence.storyteller_history[3] == last)
// 				var/alt_name
// 				if(last == "Dynamic (Player Dependent Dynamic)")
// 					alt_name = "Extended (Very Low Chaos)"
// 				else
// 					alt_name = "Dynamic (Player Dependent Dynamic)"
// 				for(var/storyteller_type in storytellers)
// 					var/datum/storyteller/story_type = storytellers[storyteller_type]
// 					if(story_type.name == alt_name)
// 						passed_type = storyteller_type
// 						break
// 				SSpersistence.storyteller_history = list(alt_name)
// 	. = ..()
