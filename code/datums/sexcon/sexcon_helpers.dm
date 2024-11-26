/datum/looping_sound/femhornylite
	mid_sounds = list('sound/vo/female/gen/se/horny1loop (1).ogg')
	mid_length = 470
	volume = 20
	extra_range = -4

/datum/looping_sound/femhornylitealt
	mid_sounds = list('sound/vo/female/gen/se/horny1loop (2).ogg')
	mid_length = 360
	volume = 20
	extra_range = -4

/datum/looping_sound/femhornymed
	mid_sounds = list('sound/vo/female/gen/se/horny2loop (1).ogg')
	mid_length = 420
	volume = 20
	extra_range = -4

/datum/looping_sound/femhornymedalt
	mid_sounds = list('sound/vo/female/gen/se/horny2loop (2).ogg')
	mid_length = 350
	volume = 20
	extra_range = -4

/datum/looping_sound/femhornyhvy
	mid_sounds = list('sound/vo/female/gen/se/horny3loop (1).ogg')
	mid_length = 440
	volume = 20
	extra_range = -4

/datum/looping_sound/femhornyhvyalt
	mid_sounds = list('sound/vo/female/gen/se/horny3loop (2).ogg')
	mid_length = 390
	volume = 20
	extra_range = -4

/mob/living
	var/can_do_sex = TRUE
	var/virginity = FALSE

/mob/living/MiddleMouseDrop_T(mob/living/target, mob/living/user)
	if(user.mmb_intent)
		return ..()
	if(!istype(target))
		return
	if(target != user)
		return
	if(!user.can_do_sex() || user.sexcon.need_to_be_violated(src)) // Changed to remove ZAPE
		to_chat(user, "<span class='warning'>I can't do this.</span>")
		return
	user.sexcon.start(src)

/mob/living/proc/can_do_sex()
	return TRUE

/mob/living/proc/make_sucking_noise()
	if(gender == FEMALE)
		playsound(src, pick('sound/misc/mat/girlmouth (1).ogg','sound/misc/mat/girlmouth (2).ogg'), 25, TRUE, ignore_walls = FALSE)
	else
		playsound(src, pick('sound/misc/mat/guymouth (1).ogg','sound/misc/mat/guymouth (2).ogg','sound/misc/mat/guymouth (3).ogg','sound/misc/mat/guymouth (4).ogg','sound/misc/mat/guymouth (5).ogg'), 35, TRUE, ignore_walls = FALSE)

/* Obsolete now, cum reagent handles pregnancy mostly.
/mob/living/proc/try_impregnate(mob/living/wife)
	var/wiferoll = rand(20)+wife.STACON
	var/husbroll = rand(20)+STACON
	if(wiferoll < husbroll) //shitty d20 roll with +1 point per const, wife tries to roll more to not get pregnant.
/mob/living/carbon/human/proc/try_impregnate(mob/living/carbon/human/wife)
	var/obj/item/organ/testicles/testes = getorganslot(ORGAN_SLOT_TESTICLES)
	if(!testes)
		return
	var/obj/item/organ/vagina/vag = wife.getorganslot(ORGAN_SLOT_VAGINA)
	if(!vag)
		return
	if(prob(25) && wife.is_fertile() && is_virile())
	//even more obsolete
	//This is the correct one used by the game. There's another sexcon that's not included in the DME. I'm stupid. - Kyo
		vag.be_impregnated(src)
		if(client?.prefs.showrolls)
			to_chat(src, span_info("My odds to impregnate... [husbroll] vs [wife]'s [wiferoll]."))
		if(wife.client?.prefs.showrolls)
			to_chat(wife, span_info("My odds to not be pregnant... [wiferoll] vs [src]'s [husbroll]."))
	else
		if(client?.prefs.showrolls)
			to_chat(src, span_info("My odds to impregnate... [husbroll] vs [wife]'s [wiferoll]."))
		if(wife.client?.prefs.showrolls)
			to_chat(wife, span_info("My odds to not be pregnant... [wiferoll] vs [src]'s [husbroll]."))
*/

/mob/living/proc/get_highest_grab_state_on(mob/living/victim)
	var/grabstate = null
	if(r_grab && r_grab.grabbed == victim)
		if(grabstate == null || r_grab.grab_state > grabstate)
			grabstate = r_grab.grab_state
	if(l_grab && l_grab.grabbed == victim)
		if(grabstate == null || l_grab.grab_state > grabstate)
			grabstate = l_grab.grab_state
	return grabstate

/proc/add_cum_floor(turfu)
	if(!turfu || !isturf(turfu))
		return
	new /obj/effect/decal/cleanable/coom(turfu)

