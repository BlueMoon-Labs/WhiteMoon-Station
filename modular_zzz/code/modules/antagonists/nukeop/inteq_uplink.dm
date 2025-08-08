/obj/item/uplink/loneop/inteq
	name = "InteQ Radio"
	desc = "A dusty looking radio with InteQ Logo."
	icon_state = "inteq-radio"
	icon = 'modular_zzz/icons/obj/device.dmi'

/obj/item/uplink/loneop/inteq/Initialize(mapload, owner, tc_amount = 65, datum/uplink_handler/uplink_handler_override = null)
	. = ..()
	var/datum/component/uplink/hidden_uplink = GetComponent(/datum/component/uplink)
	hidden_uplink.name = "InteQ Radio"
