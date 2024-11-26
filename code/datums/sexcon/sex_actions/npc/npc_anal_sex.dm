/datum/sex_action/npc_anal_sex
	name = "NPC Sodomize them"
	stamina_cost = 0
	check_same_tile = FALSE

/datum/sex_action/npc_anal_sex/shows_on_menu(mob/living/user, mob/living/target)
	return FALSE

/datum/sex_action/npc_anal_sex/can_perform(mob/living/user, mob/living/target)
	if(user.seeksfuck) //should filter down to only npcs with seeksfuck behavior.
		return TRUE
	return FALSE

/datum/sex_action/npc_anal_sex/on_start(mob/living/user, mob/living/target)
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))	//Non-Seelie on Seelie
		//Scream and rib break
		user.visible_message(span_warning("[user] forces his cock into [target]'s tiny ass!"))
		var/obj/item/bodypart/BPG = target.get_bodypart(BODY_ZONE_PRECISE_GROIN)
		target.apply_damage(30, BRUTE, BPG)
		playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)
	else if(!(HAS_TRAIT(target, TRAIT_TINY)) && HAS_TRAIT(user, TRAIT_TINY)) //Seelie on Non-Seelie action
		user.visible_message(span_warning("[user] tries and fails to insert his tiny cock into [target]'s ass."))
	else //Normal humen sized creatures or Seelie on Seelie (which would be normal)
		user.visible_message(span_warning("[user] slides his cock into [target]'s ass!"))
		playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)
	var/datum/sex_controller/sc = target.sexcon
	sc.beingfucked = TRUE

/datum/sex_action/npc_anal_sex/on_perform(mob/living/user, mob/living/target)
	if(!(HAS_TRAIT(target, TRAIT_TINY)) && HAS_TRAIT(user, TRAIT_TINY)) //Male seelie trying to fuck normal size humen
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] tries to fuck [target]'s ass, unsuccessfully."))
		do_thrust_animate(user, target)
		return FALSE //Return because male seelie cannot succesfully penetrate a large humen target
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] fucks [target]'s ass."))
		playsound(target, 'sound/misc/mat/segso.ogg', 50, TRUE, -2, ignore_walls = FALSE)

	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))
		//Body damage
		target.apply_damage(10, BRUTE, target.get_bodypart(BODY_ZONE_CHEST))
		target.apply_damage(3, BRUTE, target.get_bodypart(BODY_ZONE_PRECISE_GROIN))

	user.sexcon.perform_sex_action(user, 2, 0, TRUE)
	if(user.sexcon.check_active_ejaculation())
		user.visible_message(span_love("[user] cums into [target]'s butt!"))
		user.sexcon.cum_into(anal = TRUE)
		user.virginity = FALSE

	target.heal_overall_damage(3,3,0, updating_health = TRUE)
	if(user.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 2.4, 4, FALSE)
	else
		user.sexcon.perform_sex_action(target, 4.8, 9, FALSE)
	target.sexcon.handle_passive_ejaculation()
	user.sexcon.handle_passive_ejaculation()

/datum/sex_action/npc_anal_sex/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] pulls their cock out of [target]'s butt."))
	var/mob/living/simple_animal/hostile/retaliate/rogue/usermob = user
	usermob.stoppedfucking(target)
	var/datum/sex_controller/sc = target.sexcon
	sc.beingfucked = FALSE


/datum/sex_action/npc_anal_sex/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		if(issimple(user))
			var/mob/living/simple_animal/hostile/retaliate/rogue/simpleuser = user
			simpleuser.stoppedfucking(target)
		else
			var/mob/living/carbon/human/humanuser = user
			humanuser.stoppedfucking(target)
		var/datum/sex_controller/sc = target.sexcon
		sc.beingfucked = FALSE
		return TRUE
	return FALSE
