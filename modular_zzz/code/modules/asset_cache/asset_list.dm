/datum/asset/changelog_item/New(date)
	. = ..()
	item_filename = SANITIZE_FILENAME("[date].yml")
	SSassets.transport.register_asset("white_[item_filename]", file("html/changelogs/white_archive/" + item_filename))

/datum/asset/changelog_item/send(client)
	. = ..()
	if(!.)
		return
	. = SSassets.transport.send_assets(client, "white_[item_filename]")

/datum/asset/changelog_item/get_url_mappings()
	. = ..()
	LAZYADD(., list("white_[item_filename]" = SSassets.transport.get_asset_url("white_[item_filename]")))

/datum/asset/changelog_item/unregister()
	. = ..()
	if(!item_filename)
		return
	SSassets.transport.unregister_asset("white_[item_filename]")
