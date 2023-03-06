///////////////////////////////////////Stock Parts /////////////////////////////////

/obj/item/storage/part_replacer
	name = "rapid part exchange device"
	desc = "Special mechanical module made to store, sort, and apply standard machine parts."
	icon_state = "RPED"
	item_state = "RPED"
	w_class = ITEM_SIZE_HUGE
	can_hold = list(/obj/item/stock_parts)
	storage_slots = 50
	use_to_pickup = 1
	allow_quick_gather = 1
	allow_quick_empty = 1
	collection_mode = 1
	max_w_class = ITEM_SIZE_NORMAL
	max_storage_space = 100

/obj/item/stock_parts
	name = "stock part"
	desc = "What?"
	gender = PLURAL
	icon = 'icons/obj/stock_parts.dmi'
	randpixel = 5
	w_class = ITEM_SIZE_SMALL
	var/rating = 1

//Rank 1

/obj/item/stock_parts/console_screen
	name = "console screen"
	desc = "Used in the construction of computers and other devices with a interactive console."
	icon_state = "screen"
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list("glass" = 200)

/obj/item/stock_parts/scanning_module
	name = "scanning module"
	desc = "A compact, high resolution scanning module used in the construction of certain devices."
	icon_state = "scan_module"
	origin_tech = list(TECH_MAGNET = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 50,"glass" = 20)

/obj/item/stock_parts/manipulator
	name = "micro-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "micro_mani"
	origin_tech = list(TECH_MATERIAL = 1, TECH_DATA = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 30)

/obj/item/stock_parts/micro_laser
	name = "micro-laser"
	desc = "A tiny laser used in certain devices."
	icon_state = "micro_laser"
	origin_tech = list(TECH_MAGNET = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 10,"glass" = 20)

/obj/item/stock_parts/matter_bin
	name = "matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "matter_bin"
	origin_tech = list(TECH_MATERIAL = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 80)

//Rank 2

/obj/item/stock_parts/scanning_module/adv
	name = "advanced scanning module"
	desc = "A compact, high resolution scanning module used in the construction of certain devices."
	icon_state = "scan_module"
	origin_tech = list(TECH_MAGNET = 2)
	rating = 2
	matter = list(DEFAULT_WALL_MATERIAL = 50,"glass" = 20)

/obj/item/stock_parts/manipulator/nano
	name = "nano-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "nano_mani"
	origin_tech = list(TECH_MATERIAL = 2, TECH_DATA = 2)
	rating = 2
	matter = list(DEFAULT_WALL_MATERIAL = 30)

/obj/item/stock_parts/micro_laser/high
	name = "high-power micro-laser"
	desc = "A tiny laser used in certain devices."
	icon_state = "high_micro_laser"
	origin_tech = list(TECH_MAGNET = 2)
	rating = 2
	matter = list(DEFAULT_WALL_MATERIAL = 10,"glass" = 20)

/obj/item/stock_parts/matter_bin/adv
	name = "advanced matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "advanced_matter_bin"
	origin_tech = list(TECH_MATERIAL = 2)
	rating = 2
	matter = list(DEFAULT_WALL_MATERIAL = 80)

//Rating 3

/obj/item/stock_parts/scanning_module/phasic
	name = "phasic scanning module"
	desc = "A compact, high resolution phasic scanning module used in the construction of certain devices."
	origin_tech = list(TECH_MAGNET = 3)
	rating = 3
	matter = list(DEFAULT_WALL_MATERIAL = 50,"glass" = 20)

/obj/item/stock_parts/manipulator/pico
	name = "pico-manipulator"
	desc = "A tiny little manipulator used in the construction of certain devices."
	icon_state = "pico_mani"
	origin_tech = list(TECH_MATERIAL = 3, TECH_DATA = 2)
	rating = 3
	matter = list(DEFAULT_WALL_MATERIAL = 30)

/obj/item/stock_parts/micro_laser/ultra
	name = "ultra-high-power micro-laser"
	icon_state = "ultra_high_micro_laser"
	desc = "A tiny laser used in certain devices."
	origin_tech = list(TECH_MAGNET = 3)
	rating = 3
	matter = list(DEFAULT_WALL_MATERIAL = 10,"glass" = 20)

/obj/item/stock_parts/matter_bin/super
	name = "super matter bin"
	desc = "A container for hold compressed matter awaiting re-construction."
	icon_state = "super_matter_bin"
	origin_tech = list(TECH_MATERIAL = 3)
	rating = 3
	matter = list(DEFAULT_WALL_MATERIAL = 80)

// Subspace stock parts

/obj/item/stock_parts/subspace/ansible
	name = "subspace ansible"
	icon_state = "subspace_ansible"
	desc = "A compact module capable of sensing extradimensional activity."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 3 ,TECH_MATERIAL = 3, TECH_BLUESPACE = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 30,"glass" = 10)

/obj/item/stock_parts/subspace/filter
	name = "hyperwave filter"
	icon_state = "hyperwave_filter"
	desc = "A tiny device capable of filtering and converting super-intense radiowaves."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 30,"glass" = 10)

/obj/item/stock_parts/subspace/amplifier
	name = "subspace amplifier"
	icon_state = "subspace_amplifier"
	desc = "A compact micro-machine capable of amplifying weak subspace transmissions."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 30,"glass" = 10)

/obj/item/stock_parts/subspace/treatment
	name = "subspace treatment disk"
	icon_state = "treatment_disk"
	desc = "A compact micro-machine capable of stretching out hyper-compressed radio waves."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNET = 2, TECH_MATERIAL = 3, TECH_BLUESPACE = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 30,"glass" = 10)

/obj/item/stock_parts/subspace/analyzer
	name = "subspace wavelength analyzer"
	icon_state = "wavelength_analyzer"
	desc = "A sophisticated analyzer capable of analyzing cryptic subspace wavelengths."
	origin_tech = list(TECH_DATA = 3, TECH_MAGNETS = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 2)
	matter = list(DEFAULT_WALL_MATERIAL = 30,"glass" = 10)

/obj/item/stock_parts/subspace/crystal
	name = "ansible crystal"
	icon_state = "ansible_crystal"
	desc = "A crystal made from pure glass used to transmit laser databursts to subspace."
	origin_tech = list(TECH_MAGNET = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 2)
	matter = list("glass" = 50)

/obj/item/stock_parts/subspace/transmitter
	name = "subspace transmitter"
	icon_state = "subspace_transmitter"
	desc = "A large piece of equipment used to open a window into the subspace dimension."
	origin_tech = list(TECH_MAGNET = 3, TECH_MATERIAL = 3, TECH_BLUESPACE = 3)
	matter = list(DEFAULT_WALL_MATERIAL = 50)
/obj/item/stock_parts/capacitor
	name = "capacitor"
	desc = "A basic capacitor used in the construction of a variety of devices."
	icon_state = "capacitor"
	origin_tech = list(TECH_POWER = 1)
	matter = list(DEFAULT_WALL_MATERIAL = 50,"glass" = 50)
	var/charge = 0
	var/max_charge = 1000

/obj/item/stock_parts/capacitor/Initialize()
	. = ..()
	max_charge *= rating

/obj/item/stock_parts/capacitor/proc/charge(var/amount)
	charge += amount
	if(charge > max_charge)
		charge = max_charge

/obj/item/stock_parts/capacitor/proc/use(var/amount)
	if(charge)
		charge -= amount
		if(charge < 0)
			charge = 0

/obj/item/stock_parts/capacitor/adv
	name = "advanced capacitor"
	desc = "An advanced capacitor used in the construction of a variety of devices."
	origin_tech = list(TECH_POWER = 2)
	rating = 2

/obj/item/stock_parts/capacitor/super
	name = "super capacitor"
	desc = "A super-high capacity capacitor used in the construction of a variety of devices."
	origin_tech = list(TECH_POWER = 3, TECH_MATERIAL = 3)
	rating = 3

/obj/item/research
	name = "research debugging device"
	desc = "Instant research tool. For testing purposes only."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "smes_coil"
	origin_tech = list(TECH_MATERIAL = 19, TECH_ENGINEERING = 19, TECH_PHORON = 19, TECH_POWER = 19, TECH_BLUESPACE = 19, TECH_BIO = 19, TECH_COMBAT = 19, TECH_MAGNET = 19, TECH_DATA = 19, TECH_ILLEGAL = 19, TECH_ARCANE = 19)

// ARCHEOTECH LOOT
// ARCHEOTECH LOOT

/obj/item/rnd/eng3
	name = "xenos alloy"
	desc = "A xenos alloy forged by means unknown to the AdMech. The Mechanicus will want to study it."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "strange"
	origin_tech = list(TECH_MATERIAL = 4, TECH_ENGINEERING = 4)
	sales_price = 6

/obj/item/rnd/eng5
	name = "admech memory chip"
	desc = "Contains the partially corrupted memory banks of a deceased tech priest. The Mechanicus will want to study it."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "romos1"
	origin_tech = list(TECH_MATERIAL = 6, TECH_ENGINEERING = 6)
	sales_price = 10

/obj/item/rnd/eng8
	name = "factorum schematics"
	desc = "Forgotten schematics produced by the AdMech from a now forgotten world. The Mechanicus will want to study it."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "datadisk0"
	origin_tech = list(TECH_MATERIAL = 8, TECH_ENGINEERING = 8)
	sales_price = 40

/obj/item/rnd/eng10
	name = "STC Fragment"
	desc = "An STC Fragment with designs for manufactorum machinery... The Mechanicus will want to study it."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "datadisk6"
	origin_tech = list(TECH_MATERIAL = 10, TECH_ENGINEERING = 10)
	sales_price = 140

/obj/item/rnd/power3
	name = "strange chemical canister"
	desc = "A xenos forged canister filled with a strange chemical fuel mixture. The Mechanicus will want to study it."
	icon = 'icons/obj/power.dmi'
	icon_state = "plasmaflask"
	origin_tech = list(TECH_POWER = 4, TECH_PHORON = 4)
	sales_price = 8

/obj/item/rnd/power5
	name = "ancient plasma coil"
	desc = "The remains of a dismantled seolite plasma gun, the plasma coil is still functional... The Mechanicus will want to study it."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "unknown1"
	origin_tech = list(TECH_POWER = 6, TECH_PHORON = 6)
	sales_price = 25

/obj/item/rnd/power8
	name = "plasma drive schematics schematics"
	desc = "Forgotten starship plasma drive schematics produced by the AdMech from a now forgotten world... The Mechanicus will want to study it."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "datadisk2"
	origin_tech = list(TECH_POWER = 8, TECH_PHORON = 8)
	sales_price = 45

/obj/item/rnd/power10
	name = "STC Fragment"
	desc = "An STC Fragment with designs for an ancient voidship reactor... The Mechanicus will want to study it."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "datadisk6"
	origin_tech = list(TECH_POWER = 10, TECH_PHORON = 10)
	sales_price = 165


/obj/item/rnd/biospace3
	name = "glowing rock"
	desc = "A warpstone... it hums with vibrant energy. The Mechanicus will want to study it."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "plant1"
	origin_tech = list(TECH_BIO = 4, TECH_BLUESPACE = 4)
	sales_price = 10

/obj/item/rnd/biospace5
	name = "xenos green vial"
	desc = "A vial of strange liquid used for seolite laboratory equipment... The Mechanicus will want to study it."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "box"
	origin_tech = list(TECH_BIO = 6, TECH_BLUESPACE = 6)
	sales_price = 20

/obj/item/rnd/biospace8
	name = "xenos autodoc schematics"
	desc = "Schematics to construct a medical autodoc used by the seolite... The Mechanicus will want to study it."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "datadisk4"
	origin_tech = list(TECH_BIO = 8, TECH_BLUESPACE = 8)
	sales_price = 50

/obj/item/rnd/biospace10
	name = "Biologis Data Disk"
	desc = "An old data disk with designs from the famous Biologis Valentin Drusher... The Mechanicus will want to study it."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "datadisk6"
	origin_tech = list(TECH_BIO = 10, TECH_BLUESPACE = 10)
	sales_price = 120


/obj/item/rnd/combat3
	name = "seolite firing mechanism"
	desc = "A seolite firing mechanism used in slug firing projectile weapons. The Mechanicus will want to study it."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "anodev"
	origin_tech = list(TECH_COMBAT = 4, TECH_MAGNET = 4)
	sales_price = 6

/obj/item/rnd/combat5
	name = "archeotech weapon fragment"
	desc = "The remains of an unknown weapon from the dark age of technology. The Mechanicus will want to study it."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "egun5"
	origin_tech = list(TECH_COMBAT = 6, TECH_MAGNET = 6)
	sales_price = 15

/obj/item/rnd/combat8
	name = "archeotech weapon design"
	desc = "A weapon design for a forgotten archeotech weapon. The Mechanicus will want to study it."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "datadisk6"
	origin_tech = list(TECH_COMBAT = 8, TECH_MAGNET = 8)
	sales_price = 50

/obj/item/rnd/combat10
	name = "STC Fragment"
	desc = "An STC Fragment with designs for an exteriminatus weapon platform from the dark age of technology... The Mechanicus will want to study it."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "datadisk5"
	origin_tech = list(TECH_COMBAT = 10, TECH_MAGNET = 10)
	sales_price = 170


/obj/item/rnd/illegal3
	name = "xenos puzzle box"
	desc = "A seolite firing mechanism used in slug firing projectile weapons. The Mechanicus will want to study it."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "ano10"
	origin_tech = list(TECH_DATA = 4, TECH_ILLEGAL = 4)
	sales_price = 5

/obj/item/rnd/illegal5
	name = "xenos research notes"
	desc = "The remains of an unknown weapon from the dark age of technology. The Mechanicus will want to study it."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "measuring"
	origin_tech = list(TECH_DATA = 6, TECH_ILLEGAL = 6)
	sales_price = 10

/obj/item/rnd/illegal8
	name = "strange object"
	desc = "An AI core from a destroyed Man Of Iron. The Mechanicus will want to study it."
	icon = 'icons/obj/xenoarchaeology.dmi'
	icon_state = "unknown2"
	origin_tech = list(TECH_DATA = 8, TECH_ILLEGAL = 8)
	sales_price = 30

/obj/item/rnd/illegal10
	name = "Glowing STC Fragment"
	desc = "An STC Fragment with designs for a chaos artifact... The Mechanicus will want to study it."
	icon = 'icons/obj/stock_parts.dmi'
	icon_state = "datadisk0"
	origin_tech = list(TECH_DATA = 10, TECH_ILLEGAL = 10)
	sales_price = 140