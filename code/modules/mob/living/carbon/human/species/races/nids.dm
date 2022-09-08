/datum/species/xenos/tyranids
	name = SPECIES_TYRANID
	name_plural = "Tyranids"
	name_language = null // Use the first-name last-name generator rather than a language scrambler
	icobase = 'icons/mob/human_races/tyranids/r_tyranid.dmi'
	deform = 'icons/mob/human_races/tyranids/r_def_tyranid.dmi'
	damage_mask = 'icons/mob/human_races/masks/dam_mask_human.dmi'
	blood_mask = 'icons/mob/human_races/masks/blood_human.dmi'
	language = LANGUAGE_TYRANID
	min_age = 50
	max_age = 800
	gluttonous = GLUT_ITEM_NORMAL
	total_health = 250
	mob_size = MOB_MEDIUM
	strength = STR_VHIGH
	teeth_type = /obj/item/stack/teeth/human //til I get cool nid teeth
	sexybits_location = BP_GROIN
	var/pain_power = 80
	inherent_verbs = list(
	/mob/living/carbon/human/tyranid/proc/givetyranidtype,

	 )
	slowdown = -0.4
	unarmed_types = list(
		/datum/unarmed_attack/stomp,
		/datum/unarmed_attack/rendingclaws,
		)

	has_fine_manipulation = 1
	siemens_coefficient = 0
	gluttonous = GLUT_ANYTHING
	stomach_capacity = MOB_MEDIUM
	darksight = 20

	brute_mod = 0.87 // Hardened carapace.
	burn_mod = 0.85 // Hardened carapace.

	species_flags = SPECIES_FLAG_NO_SCAN | SPECIES_FLAG_NO_SLIP | SPECIES_FLAG_NO_POISON | SPECIES_FLAG_NO_EMBED | SPECIES_FLAG_NO_PAIN
	appearance_flags = HAS_EYE_COLOR | HAS_SKIN_COLOR

	blood_color = "#05ee05"

	gibbed_anim = "gibbed-a"
	dusted_anim = "dust-a"
	death_message = "lets out a waning guttural screech, green blood bubbling from its maw."
	death_sound = 'sound/voice/hiss6.ogg'

	speech_chance = 100

	breath_type = null
	poison_type = null

	vision_flags = SEE_SELF|SEE_MOBS

/datum/species/xenos/tyranids/handle_post_spawn(var/mob/living/carbon/human/H)
	H.age = rand(min_age,max_age)//Random age for nidders
	if(H.f_style)//nids dont get beards
		H.f_style = "Shaved"
	to_chat(H, "<big><span class='warning'>I must feed... I must sync with the hive mind (Do so in Tyranid tab)</span></big>")
	H.update_eyes()	//hacky fix, i don't care and i'll never ever care
	return ..()

/mob/living/carbon/human
	var/new_nid = SPECIES_TYRANID
	var/biomass = 100
	var/isconverting = 0
	var/dnastore = 0
	var/poolparty = 0

/mob/living/carbon/human/tyranid
	gender = MALE
	alien_talk_understand = 1


/mob/living/carbon/human/tyranid/New(var/new_loc)
	h_style = "Bald"
	..(new_loc, new_nid)

/mob/living/carbon/human/tyranid/Initialize()
	. = ..()
	fully_replace_character_name(random_nid_name(src.gender))
	warfare_faction = TYRANIDS
	var/decl/hierarchy/outfit/outfit = outfit_by_type(/decl/hierarchy/outfit/job/genestealer)
	outfit.equip(src)
	isburied = 1
	faction = "Tyranids" //keeps the homies safe from npc friends
	mind.special_role = "Tyranid" //For hud icons
	AddInfectionImages()
	thirst = INFINITY
	nutrition = INFINITY
	bladder = -INFINITY
	bowels = -INFINITY
	gsc = 1
	add_stats(rand(6,6),rand(14,16),rand(10,16),20)



	hand = 0//Make sure one of their hands is active.


/mob/living/carbon/human/tyranid/proc/givetyranidtype()
	set name = "Remember your Species"
	set category = "Tyranid"
	set desc = "Gives Tyranid Type."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	var/nidclass = input("Select a Class","Class Selection") as null|anything in list("Genestealer", "Zoanthrope")
	switch(nidclass)
		if("Genestealer")
			equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hooded/genestealer, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/tyranid, slot_glasses)
			equip_to_slot_or_del(new /obj/item/melee/baton/nidstun, slot_back)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/genestealerfeet, slot_shoes)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/genestealer, slot_head)
			visible_message("[name] stretches out, their chitin hardening as they awake from slumber.")
			playsound(src, 'sound/effects/startup.ogg', 80, 1, 1)
			src.add_stats(rand(19,24),rand(19,24),rand(19,24),6) //gives stats str, dext, end, int
			src.add_skills(rand(14,20),rand(1,4),rand(1,8),rand(1,8),rand(1,6)) //melee, ranged, med, eng, surgery
			src.set_trait(new/datum/trait/death_tolerant())
			src.update_eyes() //should fix grey vision
			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC) //secondary language
			src.verbs += /mob/living/carbon/human/tyranid/verb/convert
			src.verbs += /mob/living/carbon/human/tyranid/proc/corrosive_acid
			src.verbs += /mob/living/carbon/human/tyranid/proc/makepool
			src.verbs += /mob/living/carbon/human/proc/switch_stance
			src.verbs += /mob/living/carbon/human/proc/threat_display
			src.verbs -= /mob/living/carbon/human/tyranid/proc/givetyranidtype //removes verb at the end so they can't spam it for whatever reason
			client?.color = null

			var/obj/item/card/id/dog_tag/W = new
			W.icon_state = "tagred"
			W.assignment = "Tyranid Genestealer"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

		if("Zoanthrope")
			equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hooded/genestealer, slot_wear_suit)
			equip_to_slot_or_del(new /obj/item/clothing/glasses/tyranid, slot_glasses)
			equip_to_slot_or_del(new /obj/item/clothing/shoes/genestealerfeet, slot_shoes)
			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/genestealer, slot_head)
			visible_message("[name] stretches out, their chitin hardening as they awake from slumber.")
			playsound(src, 'sound/effects/startup.ogg', 80, 1, 1)
			src.add_stats(rand(10,14),rand(10,14),rand(10,14),24) //gives stats str, dext, end, int
			src.add_skills(rand(6,8),rand(2,5),rand(5,9),rand(4,6),rand(4,9)) //melee, ranged, med, eng, surgery
			src.set_trait(new/datum/trait/death_tolerant())
			src.mutations.Add(TK)
			src.update_eyes() //should fix grey vision
			src.add_spell(/spell/aoe_turf/conjure/forcewall)
			src.add_spell(/spell/aoe_turf/knock/psyker)
			src.add_spell(/spell/hand/charges/blood_shard)
			src.add_spell(/spell/radiant_aura/psyker)
			src.add_spell(/spell/targeted/shatter)
			src.add_spell(/spell/targeted/subjugation)
			src.add_spell(/spell/targeted/ethereal_jaunt/shift)
			src.verbs -= /mob/living/carbon/human/tyranid/proc/givetyranidtype //removes verb at the end so they can't spam it for whatever reason
			client?.color = null

			var/obj/item/card/id/dog_tag/W = new
			W.icon_state = "tagred"
			W.assignment = "Tyranid Zoanthrope"
			W.registered_name = real_name
			W.update_label()
			equip_to_slot_or_del(W, slot_wear_id)

//		if("Ravener")
//			equip_to_slot_or_del(new /obj/item/clothing/suit/storage/hooded/genestealer, slot_wear_suit)
//			equip_to_slot_or_del(new /obj/item/clothing/glasses/tyranid, slot_glasses)
//			equip_to_slot_or_del(new /obj/item/clothing/shoes/genestealerfeet, slot_shoes)
//			equip_to_slot_or_del(new /obj/item/clothing/head/helmet/genestealer, slot_head)
//			visible_message("[name] stretches out, their chitin hardening as they awake from slumber.")
//			playsound(src, 'sound/effects/startup.ogg', 80, 1, 1)
//			src.add_stats(rand(19,24),rand(19,24),rand(19,24),6) //gives stats str, dext, end, int
//			src.add_skills(rand(14,20),rand(1,4),rand(1,8),rand(14,8),rand(1,6)) //melee, ranged, med, eng, surgery
//			src.set_trait(new/datum/trait/death_tolerant())
//			src.update_eyes() //should fix grey vision
//			src.warfare_language_shit(LANGUAGE_LOW_GOTHIC) //secondary language
//			has_fine_manipulation = 0
//			src.verbs -= /mob/living/carbon/human/tyranid/proc/givetyranidtype //removes verb at the end so they can't spam it for whatever reason
//			client?.color = null
//
//			var/obj/item/card/id/dog_tag/W = new
//			W.icon_state = "tagred"
//			W.assignment = "Tyranid Ravener"
//			W.registered_name = real_name
//			W.update_label()
//			equip_to_slot_or_del(W, slot_wear_id)


//Begin abilities

/mob/living/carbon/human/tyranid/verb/convert()
	set name = "Convert"
	set desc = "Depending on your evolution progress, you must either be standing over them or next to the target."
	set category = "Tyranid"

	var/obj/item/grab/G = src.get_active_hand()
	if(!istype(G))
		to_chat(src, "<span class='warning'>We must be grabbing a creature in our active hand to convert them.</span>")
		return

	var/mob/living/carbon/human/T = G.affecting //this will be modified later as we add more rando species
	if(!istype(T))
		to_chat(src, "<span class='warning'>[T] is not compatible with our biology.</span>")
		return

	if(HUSK in T.mutations) //Eating husks would be kinda strange, but idk
		to_chat(src, "<span class='warning'>This creature's DNA is ruined beyond useability!</span>")
		return

	if(isconverting)
		to_chat(src, "<span class='warning'>We are already converting [T]!</span>")
		return
	if(T.faction == "Tyranids")
		to_chat(src, "<span class='warning'>[T] is already a member of the Hive Mind!</span>")
		return

	var/obj/item/organ/external/affecting = T.get_organ(src.zone_sel.selecting)
	if(!affecting)
		to_chat(src, "<span class='warning'>They are missing that body part!</span>") //Dont try and eat a limb that doesn't exist.

	isconverting = 1

	for(var/stage = 1, stage<=3, stage++)
		switch(stage)
			if(1)
				to_chat(src, "<span class='notice'>This creature is suitable for the hive...</span>")
			if(2)
				to_chat(src, "<span class='notice'>[src] begins to open their jaw</span>")
				src.visible_message("<span class='warning'>[src] widens their jaw!</span>")
			if(3)
				to_chat(src, "<span class='notice'>[T] is impaled by your forked tongue</span>")
				src.visible_message("<span class='danger'>[src] impales [T] with their tongue.</span>")
				to_chat(T, "<span class='danger'>You feel a sharp stabbing pain!</span>")
				affecting.take_damage(9, 0, DAM_SHARP, "large organic needle")
				src.biomass -=10
				playsound(src, 'sound/effects/lecrunch.ogg', 50, 0, -1)

		if(!do_mob(src, T, 50))
			to_chat(src, "<span class='warning'>Our conversion of [T] has been interrupted!</span>")
			isconverting = 0
			return

	to_chat(src, "<span class='notice'>We have converted [T]!</span>")
	src.visible_message("<span class='danger'>[src] completes overwriting [T]'s DNA!</span>")
	to_chat(T, "<span class='danger'>You have been converted to the Tyranid Hive Mind! Obey your new masters, communicate with the hive using ,h</span>")

	isconverting = 0

	T.faction = "Tyranids"
	T.mind.special_role = "Tyranid"
	T.gsc = 1
	src.gsc = 1
	src.mind.special_role = "Tyranid"
	T.AddInfectionImages()
	src.AddInfectionImages()//likely redundant but sometimes they don't show so better to make it check twice on both parties.
	T.add_language(LANGUAGE_TYRANID)
	src.dnastore++
	T.adjustOxyLoss(-1)
	T.adjustBruteLoss(-1)
	T.adjustToxLoss(-1)
	T.adjustBrainLoss(-1)
	T.inject_blood(src, 50)
	return 1

/mob/living/carbon/human/tyranid/proc/ripperswarm() // ok
	set name = "Call on Ripper Swarm (20)"
	set desc = "Distract them!"
	set category = "Tyranid"

	if(src.biomass < 20)
		to_chat(src, "<font color='#800080'>You don't have enough biomass!</font>")
		return
	else
		new /mob/living/simple_animal/hostile/rippers(src.loc) //Rippers in the codex are 9 models per unit
		new /mob/living/simple_animal/hostile/rippers(src.loc)
		new /mob/living/simple_animal/hostile/rippers(src.loc)
		new /mob/living/simple_animal/hostile/rippers(src.loc)
		new /mob/living/simple_animal/hostile/rippers(src.loc)
		new /mob/living/simple_animal/hostile/rippers(src.loc)
		new /mob/living/simple_animal/hostile/rippers(src.loc)
		new /mob/living/simple_animal/hostile/rippers(src.loc)
		new /mob/living/simple_animal/hostile/rippers(src.loc)
		src.biomass -= 20
		visible_message("<span class='warning'>Numerous rippers burst from the ground and immediately begin to swarm!</span>")

/mob/living/carbon/human/tyranid/proc/neurotoxin(mob/target as mob in oview())
	set name = "Spit Neurotoxin (10)"
	set desc = "Spits neurotoxin at someone, paralyzing them for a short time if they are not wearing protective gear."
	set category = "Tyranid"

	if(src.biomass < 20)
		to_chat(src, "<font color='#800080'>You don't have enough biomass!</font>")
		return

	if(stat || paralysis || stunned || weakened || lying || restrained() || buckled)
		to_chat(src, "<font color='#800080'>You cannot spit neurotoxin in your current state.</font>")
		return

	visible_message("<span class='warning'>[src] spits neurotoxin at [target]!</span>", "<span class='alium'>You spit neurotoxin at [target].</span>")

	var/obj/item/projectile/energy/neurotoxin/A = new /obj/item/projectile/energy/neurotoxin(usr.loc)
	A.launch_projectile(target,get_organ_target())
	src.biomass -=10

/mob/living/carbon/human/tyranid/proc/makepool(mob/target as mob in oview())
	set name = "Create Spawning Pool"
	set desc = "Forms a spawning pool"
	set category = "Tyranid"

	if(src.poolparty >= 2)
		to_chat(src, "<font color='#800080'>You can't make any more pools!</font>")
		return

	if(stat || paralysis || stunned || weakened || lying || restrained() || buckled)
		to_chat(src, "<font color='#800080'>You cannot make a spawning pool in your current state.</font>")
		return

	new /obj/structure/spawningpool(src.loc)
	src.poolparty++
	src.mind.special_role = "Tyranid"
	src.gsc = 1
	src.AddInfectionImages()

/mob/living/carbon/human/tyranid/proc/corrosive_acid(O as obj|turf in oview(1)) //If they right click to corrode, an error will flash if its an invalid target./N
	set name = "Corrosive Acid (5)"
	set desc = "Drench an object in acid, destroying it over time."
	set category = "Tyranid"

	if(!O in oview(1))
		to_chat(src, "<span class='alium'>[O] is too far away.</span>")
		return
	if(src.biomass < 5)
		to_chat(src, "<span class='alium'>We don't have enough biomass!</span>")
		return

	else
		new /obj/effect/acid(get_turf(O), O)
		visible_message("<span class='alium'><B>[src] vomits globs of vile stuff all over [O]. It begins to sizzle and melt under the bubbling mess of acid!</B></span>")
		src.biomass -=5
		return


/mob/living/carbon/human/genestealer/proc/givestealerstats()
	set name = "Sync with the Hive Mind"
	set category = "Tyranid"
	set desc = "Stats and unfucks vision."

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return

	visible_message("[name] listens intently to the will of the hive mind. Now is the time! The fleet is near! Communicate with your hive using ,h")
	src.AddInfectionImages()
	src.add_stats(rand(12,16),rand(14,18),rand(6,6),14) //gives stats str, end, int, dex
	src.add_skills(10,10,rand(0,3),0,0) //skills such as melee, ranged, med, eng and surg
	src.update_eyes() //should fix grey vision
	src.set_trait(new/datum/trait/death_tolerant())
	client?.color = null
	src.health = 450
	src.maxHealth = 450
	src.warfare_language_shit(LANGUAGE_TYRANID)
	src.verbs -= /mob/living/carbon/human/genestealer/proc/givestealerstats //removes verb at the end so they can't spam it for whatever reason

/mob/living/carbon/human/genestealer/proc/gsheal()
	set name = "Repair Physiology (10)"
	set category = "Tyranid"
	set desc = "Heals"

	if(src.stat == DEAD)
		to_chat(src, "<span class='notice'>You can't do this when dead.</span>")
		return
	if(src.biomass < 5)
		to_chat(src, "<span class='alium'>We don't have enough biomass!</span>")
		return
	else
		visible_message("[src] expends some of his stored biomass correting wounds and damage to their organs.")
		adjustOxyLoss(-1)
		adjustToxLoss(-1)
		adjustBrainLoss(-1)
		src.radiation = 0
		src.bodytemperature = T20C
		src.eye_blurry = 0
		src.ear_deaf = 0
		src.ear_damage = 0
		src.inject_blood(src, 50)
		src.biomass -=10


//Begin nid items

/obj/structure/spawningpool
	name = "spawning pool"
	desc = "A gelatinous mass of writing DNA and acid. It seems somehow alive. "
	icon = 'icons/mob/human_races/tyranids/tyranids.dmi'
	icon_state = "reclaimer"
	anchored = 1
	density = 1
	layer = 4
	bound_height = 32
	bound_width = 32

/obj/structure/spawningpool/attack_hand(mob/living/carbon/human/genestealer/user as mob)
	if(user.dnastore < 1)
		to_chat(user, "<font color='#800080'>I do not have any DNA to contribute to the pool...</font>")
		return
	else
		user.dnastore--
		user.biomass +=20
		to_chat(user, "<font color='#800080'>The Hive grows stronger with my contribution... </font>")
		return



/obj/structure/spawningpool/attackby(var/obj/item/O, var/mob/user)
	if((O.sharp) || istype(O, /obj/item/material/knife/butch) || istype(O, /obj/item/material/sword))//what items can cut down trees
		visible_message("<span='bnotice'[user] begins to cut apart \the [src]!</span>" )
		playsound(src, 'sound/weapons/pierce.ogg', 100, FALSE)
		if(do_after(user, 110, src))
			qdel(src)


