/obj/item/organ/stomach
	/// Whether the organ is an oversized version
	var/is_oversized

/obj/item/organ/stomach/oversized
	name = "huge guts"
	desc = "Typically found in huge creatures, this monstrous engine has developed to be highly efficient, made to get an enormous amount of nutrients to an enormous eater."
	icon = 'modular_skyrat/modules/organs/icons/stomach.dmi'
	icon_state = "stomach_big"
	maxHealth = 1.5 * STANDARD_ORGAN_THRESHOLD
	metabolism_efficiency = 0.07

/obj/item/organ/stomach/synth/oversized
	name = "huge synthetic bio-reactor"
	desc = "Typically found in huge synthetics, this monstrous engine has been developed to be highly efficient, made to provide an enormous amount of power to an enormous machine."
	icon = 'modular_skyrat/modules/organs/icons/stomach.dmi'
	icon_state = "stomach_big_synth" //ugly placeholder sorry im not an artist hehe
	maxHealth = 1.5 * STANDARD_ORGAN_THRESHOLD
	metabolism_efficiency = 0.07

// Not a stomach, but suitable for where we keep oversized schtuff.
/obj/item/organ/brain/slime/oversized
	name = "oversized core"
	desc = "The central core of a slimeperson, technically their 'extract.' Where the cytoplasm, membrane, and organelles come from; perhaps this is also a mitochondria? This one is enormous."
	brain_size = 2

/obj/item/organ/stomach/slime/oversized
	name = "huge golgi apparatus"
	desc = "Typically found in huge slimes, this monstrous organelle has been developed to be highly efficient, made to provide an enormous amount of nutrients to an enormous ooze."
	maxHealth = 1.5 * STANDARD_ORGAN_THRESHOLD
	metabolism_efficiency = 0.07
	is_oversized = TRUE
