// Правила подсчёта стоимости вооружения:
// Одна обезьянка в хардкрите - одна тысяча.
// Оружие с НовоТГ - минус пять тысяч.
// Оружие с ГанКарго - плюс десять тысяч.
// Оружие имеет ОП - плюс десять тысяч.

/datum/supply_pack/security/disabler // Три дизаблера. Каждый по 400. Максималка - четыре стамкрита за зарядку.
	cost = PAYCHECK_COMMAND * 12

/datum/supply_pack/security/eland // 1200 кредитов за каждый набор оружия, их тут три.
	cost = PAYCHECK_COMMAND * 36

/datum/supply_pack/security/plasma_marksman // 1200 кредитов за набор оружия.
	cost = PAYCHECK_COMMAND * 9

/datum/supply_pack/security/laser // 500 кредитов за каждый лазганчик.
	cost = PAYCHECK_COMMAND * 15

/datum/supply_pack/security/miecz // Двенадцать выстрелов на хардкрит без учёта брони. Достаточно дешёвое огнестрельное оружие за 1600.
	cost = PAYCHECK_COMMAND * 16

/datum/supply_pack/security/miniegun // 600 за миниеганчик, ибо еган стоит 1200.
	cost = PAYCHECK_COMMAND * 6

/datum/supply_pack/security/sidearmcrate // 1200 кредитов за каждый набор оружия, их тут два.
	cost = PAYCHECK_COMMAND * 24

/datum/supply_pack/security/wespe // 1200 кредитов за каждый набор оружия, их тут три.
	cost = PAYCHECK_COMMAND * 36
