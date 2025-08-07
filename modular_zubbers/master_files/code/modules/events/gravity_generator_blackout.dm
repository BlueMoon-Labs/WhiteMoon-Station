/datum/round_event/gravity_generator_blackout
	announce_when = 3
	start_when = 1
	announce_chance = 100

/datum/round_event/gravity_generator_blackout/announce(fake)
	priority_announce("В системах распределения массы [station_name()] обнаружен обратный всплеск. Искусственная гравитация отключена на время повторной инициализации системы. Требуется ручная реактивация генератора гравитации.", "[command_name()]: Инженерный Отдел", ANNOUNCER_GRAVGENBLACKOUT)
