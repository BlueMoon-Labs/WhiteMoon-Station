/datum/antagonist/nukeop/lone/inteq
	name = "InteQ Operative"
	nukeop_outfit = /datum/outfit/syndicate/full/loneop/inteq
	preview_outfit = /datum/outfit/syndicate/full/loneop/inteq
	suicide_cry = "FOR THE INTEQ!!"
	roundend_category = "inteq operatives"

/datum/antagonist/nukeop/lone/inteq/create_team(datum/team/nuclear/new_team)
	if(new_team)
		return ..()
	// Lone ops always get a solo team solely because a lot of nukie code is on the team
	nuke_team = new /datum/team/nuclear/loneop/inteq()
