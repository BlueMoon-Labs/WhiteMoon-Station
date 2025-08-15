// Правила подсчёта стоимости вооружения:
// Одна обезьянка в хардкрите - одна тысяча.
// Оружие с НовоТГ - минус пять тысяч.
// Оружие с ГанКарго - плюс десять тысяч.
// Оружие имеет ОП - плюс десять тысяч.

/datum/supply_pack/security/disabler // Три дизаблера. Каждый по 400. Максималка - четыре стамкрита за зарядку.
	cost = PAYCHECK_COMMAND * 12

/datum/supply_pack/security/plasma_marksman // 900 кредитов за набор оружия.
	cost = PAYCHECK_COMMAND * 9

/datum/supply_pack/security/laser // 500 кредитов за каждый лазганчик.
	cost = PAYCHECK_COMMAND * 15

/datum/supply_pack/security/miniegun // 600 за миниеганчик, ибо еган стоит 1200.
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/security/sidearmcrate // 1200 кредитов за каждый набор оружия, их тут два.
	cost = PAYCHECK_COMMAND * 24

/datum/supply_pack/security/disabler_smg // Три Дизаблер-СМГ.
	name = "Disabler SMG Crate"
	desc = "Contains three disabler SMGs, capable of rapidly firing weak disabler beams."
	cost = CARGO_CRATE_VALUE * 12
	contains = list(/obj/item/gun/energy/disabler/smg = 3)
	crate_name = "disabler smg crate"
	crate_type = /obj/structure/closet/crate/secure/plasma

/datum/supply_pack/security/energy // Один еган - 1200. Два егана - 2400.
	name = "Energy Guns Crate"
	desc = "Contains two Energy Guns, capable of firing both nonlethal and lethal \
		blasts of light."
	cost = CARGO_CRATE_VALUE * 24
	contains = list(/obj/item/gun/energy/e_gun = 2)
	crate_name = "energy gun crate"
	crate_type = /obj/structure/closet/crate/secure/plasma
