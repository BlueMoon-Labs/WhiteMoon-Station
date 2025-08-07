#define SPELLBOOK_CATEGORY_DEFENSIVE "Defensive"

/datum/spellbook_entry/lesser_heal
	name = "Lesser Heal"
	desc = "Heals the owner."
	spell_type = /datum/action/cooldown/spell/basic_heal
	category = SPELLBOOK_CATEGORY_DEFENSIVE
	cost = 1

#undef SPELLBOOK_CATEGORY_DEFENSIVE
