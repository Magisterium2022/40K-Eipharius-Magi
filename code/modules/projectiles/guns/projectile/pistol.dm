
/obj/item/gun/projectile/automatic/flamer/handflamer
	name = "Mk.1 hand flamer"
	desc = "An incredibly small hand-held flamethrower often used by the inquisition and the sisters."
	icon_state = "flamer"
	item_state = "flamer"
	wielded_item_state = "flamer-wielded"
	caliber = "flamer"
	one_hand_penalty = 0
	str_requirement = 10
	fire_sound = 'sound/effects/fire01.ogg'
	casingsound = null//No eject sound for you.
	firemodes = list()
	accuracy = -5
	automatic = 1
	fire_delay = 15
	burst=0
	magazine_type = /obj/item/ammo_magazine/flamer
	allowed_magazines = /obj/item/ammo_magazine/flamer
	can_jam = FALSE

	loaded_icon = "flamer"
	unwielded_loaded_icon = "flamer"
	wielded_loaded_icon = "flamer-wielded"
	unloaded_icon = "flamer-e"
	unwielded_unloaded_icon = "flamer-e"
	wielded_unloaded_icon = "flamer-wielded-e"
	sales_price = 70

	gun_type = GUN_LMG //anyone can use this... just not anyone should.



/obj/item/gun/projectile/colt
	name = "vintage .45 pistol"
	desc = "A cheap Martian knock-off of a Colt M1911. Uses .45 rounds."
	magazine_type = /obj/item/ammo_magazine/c45m
	allowed_magazines = /obj/item/ammo_magazine/c45m
	icon_state = "colt"
	caliber = ".45"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	load_method = MAGAZINE

/obj/item/gun/projectile/colt/officer
	name = "military .45 pistol"
	desc = "The WT45 - a mass produced kinetic sidearm well-known in films and entertainment programming for being the daily carry choice issued to officers of the Sol Central Government Defense Forces. Uses .45 rounds."
	icon_state = "usp"

/obj/item/gun/projectile/colt/officer/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "usp"
	else
		icon_state = "usp-e"

/obj/item/gun/projectile/sec
	name = ".45 pistol"
	desc = "The NT Mk58 is a cheap, ubiquitous sidearm, produced by a NanoTrasen subsidiary. Found pretty much everywhere humans are. Uses .45 rounds."
	icon_state = "secguncomp"
	magazine_type = /obj/item/ammo_magazine/c45m
	allowed_magazines = /obj/item/ammo_magazine/c45m
	caliber = ".45"
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2)
	load_method = MAGAZINE

/obj/item/gun/projectile/sec/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "secguncomp"
	else
		icon_state = "secguncomp-e"

/obj/item/gun/projectile/sec/flash
	name = ".45 signal pistol"

/obj/item/gun/projectile/sec/wood
	desc = "The NT Mk58 is a cheap, ubiquitous sidearm, produced by a NanoTrasen subsidiary. This one has a sweet wooden grip, among other modifications. Uses .45 rounds."
	name = "custom .45 Pistol"
	icon_state = "secgundark"
	accuracy = -1

/obj/item/gun/projectile/sec/wood/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "secgundark"
	else
		icon_state = "secgundark-e"

/obj/item/gun/projectile/talon
	name = "chrome stub pistol"
	desc = "A magnificent chrome stub-pistol."
	icon_state = "talon"
	w_class = ITEM_SIZE_SMALL
	fire_delay = 5
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ILLEGAL = 2)
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c45m/warfare
	allowed_magazines = /obj/item/ammo_magazine/c45m/warfare
	caliber = ".45"
	auto_eject = 1
	accuracy = -0.5 //not the best stub pistol but still pretty good
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'
	jammed_icon = "talon-j"

/obj/item/gun/projectile/talon/renegade
	name = "Renegade Pistol"
	desc = "A modified slug pistol with a heavy frame and integrated suppressor, forged for the Assassins of the infamous Renegade Navigator Houses."
	move_delay= 1.3
	one_hand_penalty = 0.5
	accuracy = -2
	fire_delay = 0.5
	silenced = 1
	force = 20
	sales_price = 35

/obj/item/gun/projectile/talon/adept
	name = "dulled stub pistol"
	desc = "A slightly dulled, worn out, stub-pistol. Beaten down from the days spent sitting in a desk drawer. It has the sigil of the Adeptus Administratum on it."

/obj/item/gun/projectile/talon/update_icon()
	..()
	if(!is_jammed)
		if(ammo_magazine && ammo_magazine.stored_ammo.len)
			icon_state = "talon"
		else
			icon_state = "talon-e"

/obj/item/gun/projectile/silenced
	name = "silenced pistol"
	desc = "A handgun with an integral silencer. Uses .45 rounds."
	icon_state = "silenced_pistol"
	w_class = ITEM_SIZE_NORMAL
	caliber = ".45"
	silenced = 1
	accuracy = 0
	fire_delay = 1.3
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ILLEGAL = 8)
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/c45m
	allowed_magazines = /obj/item/ammo_magazine/c45m

/obj/item/gun/projectile/makarov
	name = "New-o-Russia handgun"
	icon_state = "makarov"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9mm"
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc9mm
	allowed_magazines = /obj/item/ammo_magazine/mc9mm

/obj/item/gun/projectile/makarov/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "makarov"
	else
		icon_state = "makarov-e"

/obj/item/gun/projectile/genmessorp
	name = "Genmessor stubpistol"
	icon_state = "sheetp"
	w_class = ITEM_SIZE_NORMAL
	caliber = "9mm"
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc9mm
	allowed_magazines = /obj/item/ammo_magazine/mc9mm

/obj/item/gun/projectile/genmessorp/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "sheetp"
	else
		icon_state = "sheetp-e"

/obj/item/gun/projectile/magnum_pistol
	name = ".50 magnum pistol"
	desc = "The HelTek Magnus, a robust terran handgun that uses .50 AE ammo."
	icon_state = "magnum"
	item_state = "revolver"
	force = 14.0
	caliber = ".50"
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a50
	allowed_magazines = /obj/item/ammo_magazine/a50

/obj/item/gun/projectile/magnum_pistol/update_icon()
	..()
	if(ammo_magazine && ammo_magazine.stored_ammo.len)
		icon_state = "magnum"
	else
		icon_state = "magnum-e"

/obj/item/gun/projectile/gyropistol
	name = "gyrojet pistol"
	desc = "A bulky pistol designed to fire self propelled rounds."
	icon_state = "gyropistol"
	max_shells = 8
	caliber = "75"
	accuracy = -5
	origin_tech = list(TECH_COMBAT = 3)
	ammo_type = /obj/item/ammo_casing/a75
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/a75
	fire_delay = 25
	auto_eject = 1
	auto_eject_sound = 'sound/weapons/smg_empty_alarm.ogg'

/obj/item/gun/projectile/gyropistol/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "gyropistolloaded"
	else
		icon_state = "gyropistol"

/obj/item/gun/projectile/pistol
	name = "holdout pistol"
	desc = "The Lumoco Arms P3 Whisper. A small, easily concealable gun. Uses 9mm rounds."
	icon_state = "pistol"
	item_state = null
	w_class = ITEM_SIZE_SMALL
	caliber = "9mm"
	silenced = 0
	fire_delay = 1
	origin_tech = list(TECH_COMBAT = 2, TECH_MATERIAL = 2, TECH_ILLEGAL = 2)
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/mc9mm
	allowed_magazines = /obj/item/ammo_magazine/mc9mm
	condition = 400

/obj/item/gun/projectile/pistol/flash
	name = "holdout signal pistol"
	magazine_type = /obj/item/ammo_magazine/mc9mm/flash

/obj/item/gun/projectile/pistol/attack_hand(mob/user as mob)
	if(user.get_inactive_hand() == src)
		if(silenced)
			if(user.l_hand != src && user.r_hand != src)
				..()
				return
			to_chat(user, "<span class='notice'>You unscrew [silenced] from [src].</span>")
			user.put_in_hands(silenced)
			silenced = initial(silenced)
			w_class = initial(w_class)
			update_icon()
			return
	..()

/obj/item/gun/projectile/pistol/attackby(obj/item/I as obj, mob/user as mob)
	if(istype(I, /obj/item/silencer))
		if(user.l_hand != src && user.r_hand != src)	//if we're not in his hands
			to_chat(user, "<span class='notice'>You'll need [src] in your hands to do that.</span>")
			return
		user.drop_item()
		to_chat(user, "<span class='notice'>You screw [I] onto [src].</span>")
		silenced = I	//dodgy?
		w_class = ITEM_SIZE_NORMAL
		I.forceMove(src)		//put the silencer into the gun
		update_icon()
		return
	..()

/obj/item/gun/projectile/pistol/update_icon()
	..()
	if(silenced)
		icon_state = "pistol-silencer"
	else
		icon_state = "pistol"
	if(!(ammo_magazine && ammo_magazine.stored_ammo.len))
		icon_state = "[icon_state]-e"

/obj/item/silencer
	name = "silencer"
	desc = "A silencer."
	icon = 'icons/obj/weapons/gun/projectile.dmi'
	icon_state = "silencer"
	w_class = ITEM_SIZE_SMALL

/obj/item/gun/projectile/pirate
	name = "zip gun"
	desc = "Little more than a barrel, handle, and firing mechanism, cheap makeshift firearms like this one are not uncommon in frontier systems."
	icon_state = "zipgun"
	item_state = "sawnshotgun"
	handle_casings = CYCLE_CASINGS //player has to take the old casing out manually before reloading
	load_method = SINGLE_CASING
	max_shells = 1 //literally just a barrel

	var/global/list/ammo_types = list(
		/obj/item/ammo_casing/a357              = ".357",
		/obj/item/ammo_casing/shotgun           = "12 gauge",
		/obj/item/ammo_casing/shotgun           = "12 gauge",
		/obj/item/ammo_casing/shotgun/pellet    = "12 gauge",
		/obj/item/ammo_casing/shotgun/pellet    = "12 gauge",
		/obj/item/ammo_casing/shotgun/pellet    = "12 gauge",
		/obj/item/ammo_casing/shotgun/beanbag   = "12 gauge",
		/obj/item/ammo_casing/shotgun/blank = "12 gauge",
		/obj/item/ammo_casing/shotgun/flash     = "12 gauge",
		/obj/item/ammo_casing/a762              = "7.62mm",
		/obj/item/ammo_casing/a556              = "5.56mm"
		)

/obj/item/gun/projectile/pirate/New()
	ammo_type = pick(ammo_types)
	desc += " Uses [ammo_types[ammo_type]] rounds."

	var/obj/item/ammo_casing/ammo = ammo_type
	caliber = initial(ammo.caliber)
	..()

// Zip gun construction.
/obj/item/zipgunframe
	name = "zip gun frame"
	desc = "A half-finished zip gun."
	icon_state = "zipgun0"
	item_state = "zipgun-solid"
	var/buildstate = 0

/obj/item/zipgunframe/update_icon()
	icon_state = "zipgun[buildstate]"

/obj/item/zipgunframe/examine(mob/user)
	. = ..()
	..(user)
	switch(buildstate)
		if(1) to_chat(user, "It has a barrel loosely fitted to the stock.")
		if(2) to_chat(user, "It has a barrel that has been secured to the stock with tape.")
		if(3) to_chat(user, "It has a trigger and firing pin assembly loosely fitted into place.")

/obj/item/zipgunframe/attackby(var/obj/item/thing, var/mob/user)
	if(istype(thing,/obj/item/pipe) && buildstate == 0)
		user.drop_from_inventory(thing)
		qdel(thing)
		user.visible_message("<span class='notice'>\The [user] fits \the [thing] to \the [src] as a crude barrel.</span>")
		add_fingerprint(user)
		buildstate++
		update_icon()
		return
	else if(istype(thing,/obj/item/tape_roll) && buildstate == 1)
		user.visible_message("<span class='notice'>\The [user] secures the assembly with \the [thing].</span>")
		add_fingerprint(user)
		buildstate++
		update_icon()
		return
	else if(istype(thing,/obj/item/device/assembly/mousetrap) && buildstate == 2)
		user.drop_from_inventory(thing)
		qdel(thing)
		user.visible_message("<span class='notice'>\The [user] takes apart \the [thing] and uses the parts to construct a crude trigger and firing mechanism inside the assembly.</span>")
		add_fingerprint(user)
		buildstate++
		update_icon()
		return
	else if(isScrewdriver(thing) && buildstate == 3)
		user.visible_message("<span class='notice'>\The [user] secures the trigger assembly with \the [thing].</span>")
		playsound(loc, 'sound/items/Screwdriver.ogg', 50, 1)
		var/obj/item/gun/projectile/pirate/zipgun
		zipgun = new/obj/item/gun/projectile/pirate { starts_loaded = 0 } (loc)
		if(ismob(loc))
			var/mob/M = loc
			M.drop_from_inventory(src)
			M.put_in_hands(zipgun)
		transfer_fingerprints_to(zipgun)
		qdel(src)
		return
	else
		..()

/obj/item/gun/projectile/ork/slugga
	name = "slugga"
	desc = "Da classic 'ard 'itting pistal of da slugga boyz. For boyz who wantz to git in noice and klose with der choppa afta! Load'd wid da .75 caliba boolets innit."
	magazine_type = /obj/item/ammo_magazine/ork/slugga
	allowed_magazines = /obj/item/ammo_magazine/ork/slugga
	icon_state = "slugga"
	caliber = ".75"
	can_jam = TRUE //yes it can jam
	accuracy = -6 //WHY WAS IT SO FUCKING ACCURATE BEFORE? IT WAS 0.2!
	force = 20
	move_delay = 1.5
	load_method = MAGAZINE


// BOLT PISTOL

/obj/item/gun/projectile/bolter_pistol
	name = "Garm Pattern Service Bolt Pistol"
	desc = "A human sized bolter pistol, designed for usage by the Commissars of the Officio Prefectus, It also found itself in usage by officers of Astra Militarum, Rogue Traders as well Inquisitorial agents, Thus, it is relatively common and easily found across the Galaxy."
	icon_state = "bpistol"
	item_state = "bpistol"
	force = 10
	caliber = ".75"
	accuracy = -5
	fire_delay = 1.8
	move_delay = 1.5
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/bolt_pistol_magazine
	allowed_magazines = /obj/item/ammo_magazine/bolt_pistol_magazine
	slot_flags = SLOT_BELT|SLOT_S_STORE
	sales_price = 38

/obj/item/gun/projectile/bolter_pistol/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "bpistol-10"
	else
		icon_state = "bpistol-10-e"

/obj/item/gun/projectile/bolter_pistol/gold
	name = "Gold Bolt Pistol"
	desc = "A Gold Bolt Pistol. Probably meant to be in the Rogue Trader's armory. What's it doing here?"
	icon_state = "gpistol"
	item_state = "gpistol"
	force = 10
	caliber = ".75"
	accuracy = -6
	fire_delay = 3
	move_delay = 5.0 // make it shit and mostly ornamental
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/bolt_pistol_magazine
	allowed_magazines = /obj/item/ammo_magazine/bolt_pistol_magazine
	slot_flags = SLOT_BELT|SLOT_S_STORE
	sales_price = 110

/obj/item/gun/projectile/bolter_pistol/gold/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "gpistol-10"
	else
		icon_state = "gpistol-e"

/obj/item/gun/projectile/bolter_pistol/inquis
	name = "Drusian Pattern Service Bolt Pistol"
	icon_state = "bpistol"
	item_state = "bpistol"
	force = 15
	caliber = ".75"
	accuracy = -4 //VERY well maintained--maintened? eh, you get what i mean!
	fire_delay = 1.2
	move_delay = 1.3
	sales_price = 58

/obj/item/gun/projectile/bolter_pistol/astarte
	name = "Mark III Pattern Bolt Pistol"
	desc = "The standard Astarte-issued bolt pistol unlike many other sidearms is often used as a Primary weapon by the Adeptus Astartes and has proven itself just as capable as it's heavier cousins."
	icon_state = "bpistol"
	item_state = "bpistol"
	str_requirement = 18
	force = 30
	caliber = ".75"
	accuracy = -3.5 //VERY well maintained--maintened? eh, you get what i mean!
	fire_delay = 1
	move_delay = 1.5
	load_method = MAGAZINE
	magazine_type = /obj/item/ammo_magazine/bolt_pistol_magazine
	allowed_magazines = /obj/item/ammo_magazine/bolt_pistol_magazine
	slot_flags = SLOT_BELT|SLOT_S_STORE
	sales_price = 68

/obj/item/gun/projectile/bolter_pistol/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "bpistol-10"
	else
		icon_state = "bpistol-10-e"

/obj/item/gun/projectile/bolter_pistol/sisterofbattle
	name = "Godwyn-De'az Pattern Bolter Pistol"
	desc = "A heavily modified Bolter Pistol designed for the Adeptas Sororitas, It is more reliable and potent than most Bolt pistol patterns, and because it is designed for human usage, It is much smaller and lighter than most boltpistols, strangely enough, this bolt pistol has a bayonet attached to it.</i>"
	icon_state = "sisterbpistol"
	loaded_icon = "sisterbpistol"
	force = 20 //i don't think that De'az bolt pistols can have bayonets attached to them, but, imma leave this in, oh also, the Mars Pattern Mark II Scourge is the one with a bayonet.
	sharp = 1
	edge = 1
	accuracy = -3 //normally only 2 of those spawn on the map, one with the sisters, and one on a room in the caves, and they can't even be fabricated
	fire_delay = 1.5 //fastaa!
	move_delay = 1.5 //honestly this is kinda of useless
	attack_verb = list ("stabbed", "sliced")
	hitsound = "stab_sound"
	sales_price = 58

/obj/item/gun/projectile/bolter_pistol/sisterofbattle/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "sisterbpistol"
	else
		icon_state = "sisterbpistol-e"

/obj/item/gun/projectile/eldar/spistol
	name = "Shuriken pistol"
	desc = "A small shuriken-firing ballistic weapon that is the standard and most common sidearm found amongst Craftworld Aeldari warriors."
	icon_state = "shuriken_pistol"
	str_requirement = 8
	w_class = ITEM_SIZE_NORMAL
	force = 15
	slot_flags = SLOT_BACK|SLOT_S_STORE|SLOT_BELT
	max_shells = 1000 //Lots of ammo
	caliber = "shuriken"
	origin_tech = list(TECH_COMBAT = 8, TECH_MATERIAL = 5, TECH_ILLEGAL = 3)
	ammo_type = /obj/item/ammo_casing/shuriken/pistol
	load_method = MAGAZINE
	one_hand_penalty = 0 //Eldar magic
	magazine_type = /obj/item/ammo_magazine/spistol_magazine
	allowed_magazines = /obj/item/ammo_magazine/spistol_magazine
	handle_casings = CLEAR_CASINGS
	auto_eject = 1
	fire_sound = 'sound/weapons/guns/fire/needler_fire.ogg'
	unload_sound 	= 'sound/weapons/guns/interact/ltrifle_magout.ogg'
	reload_sound 	= 'sound/weapons/guns/interact/ltrifle_magin.ogg'
	cock_sound 		= 'sound/weapons/guns/interact/ltrifle_cock.ogg'
	loaded_icon = "scatapult"
	unloaded_icon = "scatapult-e"
	fire_delay = 0.5
	burst = 1
	move_delay = 0
	automatic = 1
	firemodes = list(
		list(mode_name="semiauto",       burst=1, fire_delay=0.5,    move_delay=null, one_hand_penalty=0, burst_accuracy=null, dispersion=null, automatic = 0),
		list(mode_name="automatic",   	 burst=10, fire_delay=1.5,  move_delay=0, one_hand_penalty=1, burst_accuracy=list(0,-1,-1), dispersion=list(0.0, 0.1, 0.2), automatic = 2)
		)
	gun_type = GUN_AUTOMATIC
	accuracy = 2

/obj/item/gun/projectile/eldar/spistol/update_icon()
	..()
	if(ammo_magazine)
		icon_state = "shuriken_pistol"
	else
		icon_state = "shuriken_pistol-e"
