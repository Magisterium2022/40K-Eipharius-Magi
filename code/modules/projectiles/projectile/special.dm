/obj/item/projectile/ion
	name = "ion bolt"
	icon_state = "ion"
	fire_sound = 'sound/weapons/Laser.ogg'
	damage = 0
	damage_type = BURN
	nodamage = 1
	check_armour = "energy"
	var/heavy_effect_range = 1
	var/light_effect_range = 2

	on_impact(var/atom/A)
		empulse(A, heavy_effect_range, light_effect_range)
		return 1

/obj/item/projectile/ion/small
	name = "ion pulse"
	heavy_effect_range = 0
	light_effect_range = 1

/obj/item/projectile/bullet/bolterrifle
	name =".75 bolt" //.75, astartes sized bolters or boltpistols
	icon_state= "bolter"
	damage = 75
	armor_penetration = 36 //this is totally not cause its a .75
	check_armour = "bullet"

/obj/item/projectile/bullet/bolterrifle/astartes
	name =".95 bolt"  // Will make kraken penetrator variants later.
	icon_state= "bolter"
	damage = 89
	armor_penetration = 40
	check_armour = "bullet"

/obj/item/projectile/bullet/bpistol
	name =".50 bolt" //.50, human sized bolters and bolt pistols
	icon_state= "bolter"
	damage = 68
	check_armour = "bullet"
	armor_penetration = 34

// SPECIAL BOLT ROUNDS

/obj/item/projectile/bullet/bpistol/kp
	fire_sound = 'sound/effects/explosion1.ogg'
	damage = 73
	armor_penetration = 39
	penetrating = 2

/obj/item/projectile/bullet/bolt/kp
	fire_sound = 'sound/effects/explosion1.ogg'
	damage = 83
	armor_penetration = 41
	penetrating = 2

/obj/item/projectile/bullet/bpistol/ms // This is .75 Bolt Pistol Round
	fire_sound = 'sound/effects/explosion1.ogg'
	damage = 79
	armor_penetration = 35

/obj/item/projectile/bullet/bolt/ms
	fire_sound = 'sound/effects/explosion1.ogg'
	damage = 89
	armor_penetration = 37

/obj/item/projectile/meteor
	name = "meteor"
	icon = 'icons/obj/meteor.dmi'
	icon_state = "smallf"
	damage = 0
	damage_type = BRUTE
	nodamage = 1
	check_armour = "bullet"

	Bump(atom/A as mob|obj|turf|area)
		if(A == firer)
			loc = A.loc
			return

		sleep(-1) //Might not be important enough for a sleep(-1) but the sleep/spawn itself is necessary thanks to explosions and metoerhits

		if(src)//Do not add to this if() statement, otherwise the meteor won't delete them
			if(A)

				A.ex_act(2)
				playsound(src.loc, 'sound/effects/meteorimpact.ogg', 40, 1)

				for(var/mob/M in range(10, src))
					if(!M.stat && !istype(M, /mob/living/silicon/ai))\
						shake_camera(M, 3, 1)
				qdel(src)
				return 1
		else
			return 0


/obj/item/projectile/beam/mindflayer
	name = "flayer ray"

	on_hit(var/atom/target, var/blocked = 0)
		if(ishuman(target))
			var/mob/living/carbon/human/M = target
			M.confused += rand(5,8)

/obj/item/projectile/chameleon
	name = "bullet"
	icon_state = "bullet"
	damage = 1 // stop trying to murderbone with a fake gun dumbass!!!
	embed = 0 // nope
	nodamage = 1
	damage_type = PAIN
	muzzle_type = /obj/effect/projectile/bullet/muzzle

/obj/item/projectile/fire_spray
	name = "fire"
	icon_state = "fire"
	damage = 0 //It catches stuff on fire and doesn't actually do damage.
	muzzle_type = /obj/effect/projectile/bullet/muzzle

	Bump(atom/A as mob|obj|turf|area)
		if(ishuman(A))
			var/mob/living/carbon/human/H = A
			H.adjust_fire_stacks(10)
			H.IgniteMob()

/obj/item/projectile/flamer
	name = "fire"
	icon_state = "flame"
	damage = 3
	range =  5//Very short range.
	damage_type = BURN
	mob_hit_sound = list('sound/effects/fire.ogg')
	speed = 0.8

/obj/item/projectile/flamer/on_hit(var/atom/target, var/blocked = 0)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(!istype(H.wear_suit, /obj/item/clothing/suit/fire))
			H.adjust_fire_stacks(10) //note left by walker, any more than 10 is impossibly OP
			H.IgniteMob()
		new /obj/flamer_fire(H.loc, 12, 10, "red", 1)

/obj/item/projectile/flamer/salamander
	name = "fire"
	icon_state = "flame"
	damage = 30
	armor_penetration = 35
	range =  5//Very short range.
	damage_type = BURN
	mob_hit_sound = list('sound/effects/fire.ogg')
	speed = 0.8

/obj/item/projectile/flamer/salamander/on_hit(var/atom/target, var/blocked = 0)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(!istype(H.wear_suit, /obj/item/clothing/suit/fire))
			H.adjust_fire_stacks(5) //note left by walker, any more than 10 is impossibly OP
			H.IgniteMob()
		new /obj/flamer_fire(H.loc, 12, 10, "blue", 1)

/obj/item/projectile/warpfire
	name = "warp fire"
	icon_state = "declone"
	damage = 15
	range =  7
	damage_type = BURN
	mob_hit_sound = list('sound/effects/fire.ogg')
	speed = 1

/obj/item/projectile/warpfire/on_hit(var/atom/target, var/blocked = 0)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(!istype(H.wear_suit, /obj/item/clothing/suit/wizrobe/psypurple))
			H.adjust_fire_stacks(10)
			H.IgniteMob()
		new /obj/warpfire(H.loc, 16, 12, "green", 3)


// FLESH MOUTH
/obj/necrofleshmouth
	name = "infester mouth"
	icon = 'icons/turf/flooring/decals.dmi'
	icon_state = "necro2"
	anchored = 1
	mouse_opacity = 0
	layer = BELOW_OBJ_LAYER

/obj/necrofleshmouth/CanPass(atom/movable/mover, turf/target, height=0, air_group=0)
	return TRUE

/obj/necrofleshmouth/Crossed(AM as mob|obj)
	if (ismob(AM))
		var/mob/M = AM
		if (ishuman(M))
			var/mob/living/carbon/human/H = M
			if (prob (33))
				playsound(loc, "stab_sound", 60, TRUE)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if (affecting.status & ORGAN_ROBOT)
					return
				if (affecting.take_damage(40, FALSE))
					H.UpdateDamageIcon()
				H.updatehealth()
				to_chat(H, "<span class = 'red'><b>Your [affecting.name] gets bitten by \the [src]!</b></span>")
			else if (prob (33))
				playsound(loc, "stab_sound", 80, TRUE)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if (affecting.status & ORGAN_ROBOT)
					return
				if (affecting.take_damage(45, FALSE))
					H.UpdateDamageIcon()
				H.updatehealth()
				to_chat(H, "<span class = 'red'><b>Your [affecting.name] gets bitten by \the [src]!</b></span>")
			else
				playsound(loc, "stab_sound", 100, TRUE)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if (affecting.status & ORGAN_ROBOT)
					return
				if (affecting.take_damage(50, FALSE))
					H.UpdateDamageIcon()
				H.updatehealth()
				to_chat(H, "<span class = 'red'><b>Your [affecting.name] gets chomped by \the [src]!</b></span>")
	return ..()

/obj/necrofleshmouth/Uncross(AM as mob)
	if(ismob(AM))
		var/mob/M = AM
		if (ishuman(M))
			if(prob(75))
				M.visible_message("<span class='danger'>[M] struggle to free themselves from the barbed teeth!</span>")
				var/mob/living/carbon/human/H = M
				playsound(loc, "stab_sound", 50, TRUE)
				var/obj/item/organ/external/affecting = H.get_organ(pick("l_foot", "r_foot", "l_leg", "r_leg"))
				if (affecting.status & ORGAN_ROBOT)
					return
				if (affecting.take_damage(8, FALSE))
					H.UpdateDamageIcon()
				H.updatehealth()
				return FALSE
			else
				M.visible_message("<span class='danger'>[M] frees themself from the barbed teeth!</span>")
				return TRUE
	return ..()


/obj/necrofleshmouth/blood
	name = "infester mouth"
	icon = 'icons/map_project/eldritch/Flesh_Ground.dmi'
	icon_state = "flesh_floor-4"
	anchored = 1
	mouse_opacity = 0
	layer = BELOW_OBJ_LAYER
// FLOWER

/// FLAMER FIRE

/obj/flamer_fire
	name = "fire"
	desc = "Ouch!"
	anchored = 1
	mouse_opacity = 0
	icon = 'icons/effects/fire.dmi'
	icon_state = "red_2"
	layer = BELOW_OBJ_LAYER
	var/firelevel = 1 //Tracks how much "fire" there is. Basically the timer of how long the fire burns
	var/burnlevel = 10 //Tracks how HOT the fire is. This is basically the heat level of the fire and determines the temperature.
	var/flame_color = "red"
	var/canSpreadDir = NORTH | SOUTH | EAST | WEST

/obj/flamer_fire/New(loc, fire_lvl, burn_lvl, f_color, fire_spread_amount, BlockedDirs)
	..()
	if (f_color)
		flame_color = f_color

	icon_state = "[flame_color]_2"
	if(fire_lvl) firelevel = fire_lvl
	if(burn_lvl) burnlevel = burn_lvl
	if(BlockedDirs)
		canSpreadDir &= ~BlockedDirs
	START_PROCESSING(SSobj,src)

	if(fire_spread_amount > 0)
		var/turf/T
		for(var/dirn in GLOB.cardinal)
			if(!(dirn & canSpreadDir))
				continue
			T = get_step(loc, dirn)
			if(istype(T,/turf/simulated/open)) continue
			if(locate(/obj/flamer_fire) in T) continue //No stacking
			var/new_spread_amt = T.density ? 0 : fire_spread_amount - 1 //walls stop the spread
			if(new_spread_amt)
				for(var/obj/O in T)
					if(!O.CanPass(src, loc))
						new_spread_amt = 0
						break
			addtimer(CALLBACK(src, .proc/make_more_fire,T, fire_lvl, burn_lvl, f_color, new_spread_amt, ~canSpreadDir), 0) //Do not put spawns in recursive things.

/obj/flamer_fire/proc/make_more_fire(var/T, var/f_level, var/b_level, var/fcolor, var/new_spread, var/blockedDirs)
	new /obj/flamer_fire(T, f_level, b_level, fcolor, new_spread, blockedDirs)

/obj/flamer_fire/Destroy()
	set_light(0)
	STOP_PROCESSING(SSobj,src)
	. = ..()

/obj/flamer_fire/Crossed(mob/living/M) //Only way to get it to reliable do it when you walk into it.
	if(istype(M))
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(istype(H.wear_suit, /obj/item/clothing/suit/fire) || istype(H.wear_suit, /obj/item/clothing/suit/armor/astartes) || istype(H.wear_suit, /obj/item/clothing/suit/sisterofbattle) ||  istype(H.wear_suit, /obj/item/clothing/suit/wizrobe/psypurple) || istype(H.wear_suit, /obj/item/clothing/suit/armor/ordohereticus))
				H.show_message(text("Your suit protects you from the flames."),1)
				H.adjustFireLoss(burnlevel*0.25) //Does small burn damage to a person wearing one of the suits.
				return
		M.adjust_fire_stacks(burnlevel) //Make it possible to light them on fire later.
		if (prob(firelevel + 2*M.fire_stacks)) //the more soaked in fire you are, the likelier to be ignited
			M.IgniteMob()

		M.adjustFireLoss(round(burnlevel*0.5)) //This makes fire stronk.
		to_chat(M, "<span class='danger'>You are burned!</span>")

/obj/flamer_fire/proc/updateicon()
	if(burnlevel < 15)
		color = "#c1c1c1" //make it darker to make show its weaker.
	switch(firelevel)
		if(1 to 9)
			icon_state = "[flame_color]_1"
			set_light(2, l_color = "#E38F46")
		if(10 to 25)
			icon_state = "[flame_color]_2"
			set_light(4, l_color = "#E38F46")
		if(25 to INFINITY) //Change the icons and luminosity based on the fire's intensity
			icon_state = "[flame_color]_3"
			set_light(6, l_color = "#E38F46")

/obj/flamer_fire/Process()
	var/turf/T = loc
	firelevel = max(0, firelevel)
	if(!istype(T)) //Is it a valid turf? Has to be on a floor
		qdel(src)
		return

	updateicon()

	if(!firelevel)
		qdel(src)
		return

	for(var/mob/living/I in loc)
		if(istype(I,/mob/living/carbon/human))
			var/mob/living/carbon/human/M = I
			if(istype(M.wear_suit, /obj/item/clothing/suit/fire) || istype(M.wear_suit, /obj/item/clothing/suit/armor/astartes) || istype(M.wear_suit, /obj/item/clothing/suit/sisterofbattle) || istype(M.wear_suit || istype(M.wear_suit, /obj/item/clothing/suit/sisterofbattle) , /obj/item/clothing/suit/armor/ordohereticus)  || istype(M.wear_suit, /obj/item/clothing/suit/storage/hooded/ruststalker) || istype(M.wear_suit, /obj/item/clothing/suit/armor/catachan/flamerspecialist))
				M.show_message(text("Your suit protects you from the flames."), 1)
				M.adjustFireLoss(rand(0 ,burnlevel*0.25)) //Does small burn damage to a person wearing one of the suits.
				continue
		I.adjust_fire_stacks(burnlevel) //If i stand in the fire i deserve all of this. Also Napalm stacks quickly.
		if(prob(firelevel)) I.IgniteMob()
		I.show_message(text("<span class='warning'>You are burned!</span>"),1)

	//This has been made a simple loop, for the most part flamer_fire_act() just does return, but for specific items it'll cause other effects.
	firelevel -= 2 //reduce the intensity by 2 per tick
	return


//WARPFIRE (And potentially other warp based effects later on)

/obj/warpfire
	name = "warp fire"
	desc = "Run!"
	anchored = 1
	mouse_opacity = 0
	icon = 'icons/effects/fire.dmi'
	icon_state = "green_2"
	layer = BELOW_OBJ_LAYER
	var/firelevel = 18 //Tracks how much "fire" there is. Basically the timer of how long the fire burns
	var/burnlevel = 15 //Tracks how HOT the fire is. This is basically the heat level of the fire and determines the temperature.
	var/flame_color = "green"
	var/canSpreadDir = NORTH | SOUTH | EAST | WEST

/obj/warpfire/New(loc, fire_lvl, burn_lvl, f_color, fire_spread_amount, BlockedDirs)
	..()
	if (f_color)
		flame_color = f_color

	icon_state = "[flame_color]_2"
	if(fire_lvl) firelevel = fire_lvl
	if(burn_lvl) burnlevel = burn_lvl
	if(BlockedDirs)
		canSpreadDir &= ~BlockedDirs
	START_PROCESSING(SSobj,src)

	if(fire_spread_amount > 0)
		var/turf/T
		for(var/dirn in GLOB.cardinal)
			if(!(dirn & canSpreadDir))
				continue
			T = get_step(loc, dirn)
			if(istype(T,/turf/simulated/open)) continue
			if(locate(/obj/warpfire) in T) continue //No stacking
			var/new_spread_amt = T.density ? 0 : fire_spread_amount - 1 //walls stop the spread
			if(new_spread_amt)
				for(var/obj/O in T)
					if(!O.CanPass(src, loc))
						new_spread_amt = 0
						break
			addtimer(CALLBACK(src, .proc/make_more_fire,T, fire_lvl, burn_lvl, f_color, new_spread_amt, ~canSpreadDir), 0) //Do not put spawns in recursive things.

/obj/warpfire/proc/make_more_fire(var/T, var/f_level, var/b_level, var/fcolor, var/new_spread, var/blockedDirs)
	new /obj/warpfire(T, f_level, b_level, fcolor, new_spread, blockedDirs)

/obj/warpfire/Destroy()
	set_light(0)
	STOP_PROCESSING(SSobj,src)
	. = ..()

/obj/warpfire/Crossed(mob/living/M) //Only way to get it to reliable do it when you walk into it.
	if(istype(M))
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(istype(H.wear_suit, /obj/item/clothing/suit/wizrobe/psypurple))
				H.show_message(text("Your Psyker powers protect you from the flames."),1)
				return
		M.adjust_fire_stacks(burnlevel) //Make it possible to light them on fire later.
		if (prob(firelevel + 2*M.fire_stacks)) //the more soaked in fire you are, the likelier to be ignited
			M.IgniteMob()

		M.adjustFireLoss(round(burnlevel*0.5)) //This makes fire stronk.
		to_chat(M, "<span class='danger'>You are burned!</span>")

/obj/warpfire/proc/updateicon()
	if(burnlevel < 15)
		color = "#c1c1c1" //make it darker to make show its weaker.
	switch(firelevel)
		if(1 to 9)
			icon_state = "[flame_color]_1"
			set_light(2, l_color = "#E38F46")
		if(10 to 25)
			icon_state = "[flame_color]_2"
			set_light(4, l_color = "#E38F46")
		if(25 to INFINITY) //Change the icons and luminosity based on the fire's intensity
			icon_state = "[flame_color]_3"
			set_light(6, l_color = "#E38F46")

/obj/warpfire/Process()
	var/turf/T = loc
	firelevel = max(0, firelevel)
	if(!istype(T)) //Is it a valid turf? Has to be on a floor
		qdel(src)
		return

	updateicon()

	if(!firelevel)
		qdel(src)
		return

	for(var/mob/living/I in loc)
		if(istype(I,/mob/living/carbon/human))
			var/mob/living/carbon/human/M = I
			if(istype(M.wear_suit, /obj/item/clothing/suit/wizrobe/psypurple))
				M.show_message(text("Your Psyker powers protect you from the flames."),1)
				return
		I.adjust_fire_stacks(burnlevel) //If i stand in the fire I deserve all of this. Also warpfire stacks quickly.
		if(prob(firelevel)) I.IgniteMob()
		I.show_message(text("<span class='warning'>You are burned!</span>"),1)

	//This has been made a simple loop, for the most part flamer_fire_act() just does return, but for specific items it'll cause other effects.
	firelevel -= 2 //reduce the intensity by 2 per tick
	return

/obj/warpfire/warp/Crossed(mob/living/M) //Only way to get it to reliable do it when you walk into it.
	if(istype(M))
		if(ishuman(M))
			var/mob/living/carbon/human/H = M
			if(istype(H.wear_suit, /obj/item/clothing/suit/wizrobe/psypurple)) //It's magic warpfire, so only Psykers (Denoted by the outfit for now) can survive
				H.show_message(text("Your psyker powers protect you from the flames."),1)
				H.adjustFireLoss(burnlevel*0.25) //Does small burn damage to a person wearing one of the suits.
				return
		M.adjust_fire_stacks(burnlevel) //Make it possible to light them on fire later.
		if (prob(firelevel + 2*M.fire_stacks)) //the more soaked in fire you are, the likelier to be ignited
			M.IgniteMob()

		M.adjustFireLoss(round(burnlevel*0.5)) //This makes fire stronk.
		to_chat(M, "<span class='danger'>You are burned!</span>")



//this is the PHOSPHOR energy gun, its really fucking OP in lore because it burns through almost anything until they are dead, im not sure why the pain is so huge tho.
/obj/item/projectile/energy/phosphor
	name = "phosphor splash"
	icon_state = "pulse1"
	fire_sound = 'sound/weapons/gunshot/gunshot_pistol.ogg'
	damage = 35 //phosphor blasters are incredibly powerful weapons, almost never used
	check_armour = "energy"
	armor_penetration = 40 //phosphor blasters are incredibly good at penetrating heavy armor
	range =  6 //extremely close ranged, normal vision is 8 but technically 7 if you don't count your own tile.


/obj/item/projectile/energy/phosphor/on_hit(var/atom/target, var/blocked = 0)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
		if(!istype(H.wear_suit, /obj/item/clothing/suit/armor/seolsuit))
			H.adjust_fire_stacks(5) //i know this aint lore accurate, but if you want to buff this, nerf pain.
			H.IgniteMob()
		new /obj/flamer_fire(H.loc, 12, 10, "red", 1)


/obj/item/projectile/gauss
	name = "Gauss "
	icon_state = "emitter"
	fire_sound = 'sound/weapons/emitter.ogg' //P e w
	damage = 100
	damage_type = BURN
	agony = 200
	check_armour = "energy"
	speed = 0.1
	incinerate = 1
	dispersion = 0.0
	animate_movement = 1
	penetrating = 2 //10 was a bit much
	armor_penetration = 40 //this shit tears down individual atoms.. what do you expect?

/obj/item/projectile/energy/meltagun
	name = "Meltagun beam"
	icon_state = "melta"
	damage = 135
	agony = 35
	damage_type = BURN
	check_armour = "energy"
	mob_hit_sound = list('sound/effects/gore/sear.ogg')
	range =  5
	incinerate = 1
	penetrating = 2
	armor_penetration = 42
	var/flash_range = 1
	var/brightness = 10
	var/light_colour = "#ffffff"

/obj/item/projectile/energy/meltagun/on_impact(var/atom/A)
	var/turf/T = flash_range? src.loc : get_turf(A)
	if(!istype(T)) return

	//blind and confuse adjacent people
	for (var/mob/living/carbon/M in viewers(T, flash_range))
		if(M.eyecheck() < FLASH_PROTECTION_MODERATE)
			M.flash_eyes()
			M.eye_blurry += (brightness / 2)
			M.confused += (brightness / 2)

	//snap pop
	playsound(src, 'sound/effects/snap.ogg', 50, 1)
	src.visible_message("<span class='warning'>\The [src] explodes in a bright flash!</span>")

	var/datum/effect/effect/system/spark_spread/sparks = new /datum/effect/effect/system/spark_spread()
	sparks.set_up(2, 1, T)
	sparks.start()

//TYRANID

/obj/item/projectile/bullet/tyranid
	name = "Tyranid bullet, just a categorisation object."
	fire_sound = 'sound/weapons/gunshot/gunshot2.ogg'
	damage = 0
	armor_penetration = 0
	penetrating = 0
	stun = 0
	weaken = 0
	paralyze = 0
	irradiate = 0
	stutter = 0
	eyeblur = 0
	drowsy = 0
	agony = 0

	incinerate = 0
	embed = 0 // whether or not the projectile can embed itself in the mob
	is_shrapnel = FALSE
	//shrapnel_type //type of shrapnel the projectile leaves in its target.

/obj/item/projectile/bullet/tyranid/fleshborer
	name = "fleshborer beetle"
	damage = 15
	armor_penetration = 25
	agony = 25
	embed = 1
/*/obj/item/projectile/bullet/tyranid/fleshborer/on_hit(var/atom/target)
	if(ishuman(target))
		if var/fleshborer < 10
			target.fleshborer =+ 1
	else return*/ //I'll get this properly set up once I've considered how to implement a scaling damage function and given mobs a fleshborer tracking value.

/obj/item/projectile/bullet/tyranid/spike
	name = "spike rifle spike"
	damage = 25
	armor_penetration = 35
	agony = 5
	embed = 1

/obj/item/projectile/bullet/tyranid/spike/hall
	name = "spike rifle spike"
	damage = 25
	armor_penetration = 35
	agony = 5
	embed = 1

/obj/item/projectile/bullet/tyranid/spike/hall/on_hit(var/atom/target, var/blocked = 0)
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/M = target
		M.reagents.add_reagent(/datum/reagent/toxin/tyranid/hall, 15)

/obj/item/projectile/bullet/tyranid/spike/sleepy
	name = "spike rifle spike"
	damage = 25
	armor_penetration = 35
	agony = 5
	embed = 1

/obj/item/projectile/bullet/tyranid/spike/sleepy/on_hit(var/atom/target, var/blocked = 0)
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/M = target
		M.reagents.add_reagent(/datum/reagent/toxin/tyranid/sleepy, 5)



/obj/item/projectile/bullet/tyranid/venomcannon
	name = "venom cannon shard"
	damage = 20
	armor_penetration = 35
	stun = 5
	weaken = 5
	agony = 25
	embed = 1

/obj/item/projectile/bullet/tyranid/venomcannon/on_hit(var/atom/target, var/blocked = 0)
	if(istype(target, /mob/living/carbon/human))
		var/mob/living/carbon/human/M = target
		M.reagents.add_reagent(/datum/reagent/toxin/tyranid/acid, 5)

/*/obj/item/projectile/energy/grav
	name = "grav bolt"
	icon_state = "ion"
	fire_sound = 'sound/weapons/Laser.ogg'
	damage = 0
	damage_type = BURN
	nodamage = 1
	check_armour = "energy"

/obj/item/projectile/energy/grav/on_hit(var/atom/target, var/blocked = 0)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
			H.Weaken(15)
	if(istype(target, /turf/simulated/wall))
		var/turf/simulated/wall/W = target
			W.dismantle_wall(1)
			explosion(location, -1, -1, 1, 2)
			visible_message("<span class='danger'>The [src] falls apart unders its own weight!</span>")

/obj/item/projectile/energy/grav/strong
	name = "grav bolt"
	icon_state = "ion"
	fire_sound = 'sound/weapons/Laser.ogg'
	damage = 0
	damage_type = BURN
	check_armour = "energy"

/obj/item/projectile/energy/grav/strong/on_hit(var/atom/target, var/blocked = 0)
	if(ishuman(target))
		var/mob/living/carbon/human/H = target
			H.gib
			visible_message("<span class='danger'>[H] is torn apart by their own weight!</span>")
	if(istype(target, /turf/simulated/wall))
		var/turf/simulated/wall/W = target
			W.dismantle_wall(1)
			explosion(location, -1, -1, 1, 2)
			visible_message("<span class='danger'>The [src] falls apart unders its own weight!</span>")*/


/obj/item/projectile/archeotech //Categorisation object.
	name = "Archeotech Shot"
	icon_state = "ion"
	fire_sound = 'sound/weapons/Laser.ogg'
	damage = 0
	damage_type = BURN
	nodamage = 1
	check_armour = "energy"

/obj/item/projectile/archeotech/explosion
	name = "Explosive Archeotech Shot"
	icon_state = "ion"
	fire_sound = 'sound/weapons/Laser.ogg'
	damage = 5
	armor_penetration = 60
	damage_type = BURN
	check_armour = "energy"

/obj/item/projectile/archeotech/explosion/on_hit(var/atom/target, var/blocked = 0)
	if(isturf(target))
		explosion(target, 1, 2, 3)
	..()

/obj/item/projectile/archeotech/anticausality
	name = "Anticausal Archeotech Shot"
	icon_state = "bluespace"
	fire_sound = 'sound/weapons/Laser.ogg'
	damage = 5
	armor_penetration = 60
	damage_type = BURN
	check_armour = "energy"

/obj/item/projectile/archeotech/anticausality/on_hit(var/atom/target, var/blocked = 0)
	if(ismob(target))
		var/mobloc = get_turf(target.loc)
		var/obj/effect/dummy/spell_jaunt/holder = new /obj/effect/dummy/spell_jaunt( mobloc )
		var/atom/movable/overlay/animation = new /atom/movable/overlay( mobloc )
		animation.SetName("water")
		animation.set_density(0)
		animation.anchored = 1
		animation.icon = 'icons/mob/mob.dmi'
		animation.layer = 5
		animation.master = holder
		target.mob_delete
	if(isturf(target))
		return
	else
		target.qdel
	..()

/obj/item/projectile/archeotech/anticausality/proc/mob_delete(var/atom/movable/overlay/animation, var/mob/living/target)
	visible_message("<span class='danger'>[target] vanishes in a flow of anticausal particles!</span>")
	animation.icon_state = "liquify"
	flick("liquify",animation)
	target.qdel
