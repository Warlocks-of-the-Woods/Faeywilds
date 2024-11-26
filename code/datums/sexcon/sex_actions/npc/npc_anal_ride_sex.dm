/datum/sex_action/npc_anal_ride_sex
	name = "NPC Ride them anally"
	stamina_cost = 0
	check_same_tile = FALSE

/datum/sex_action/npc_anal_ride_sex/shows_on_menu(mob/living/user, mob/living/target)
	return FALSE

/datum/sex_action/npc_anal_ride_sex/can_perform(mob/living/user, mob/living/target)
	if(user.seeksfuck) //should filter down to only npcs with seeksfuck behavior.
		return TRUE
	return FALSE

/datum/sex_action/npc_anal_ride_sex/on_start(mob/living/user, mob/living/target)
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))
		user.visible_message(span_warning("[user] gets on top of [target], trying and failing to ride the tiny cock with their ass!"))
	else
		user.visible_message(span_warning("[user] gets on top of [target] and begins riding them with their ass!"))
		playsound(target, list('sound/misc/mat/insert (1).ogg','sound/misc/mat/insert (2).ogg'), 20, TRUE, ignore_walls = FALSE)
	var/datum/sex_controller/sc = target.sexcon
	sc.beingfucked = TRUE


/datum/sex_action/npc_anal_ride_sex/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] tries to ride [target], unsuccessfully."))
			do_thrust_animate(user, target)
			return	//Return because male seelie cannot succesfully penetrate a large humen target
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] rides [target]."))
		playsound(target, 'sound/misc/mat/segso.ogg', 50, TRUE, -2, ignore_walls = FALSE)

	if(target.sexcon.considered_limp())
		user.sexcon.perform_sex_action(target, 2.4, 4, TRUE)
	else
		user.sexcon.perform_sex_action(target, 4.8, 9, TRUE)
	target.sexcon.handle_passive_ejaculation()
	user.sexcon.handle_passive_ejaculation()

	target.heal_overall_damage(3,3,0, updating_health = TRUE)

	user.sexcon.perform_sex_action(target, 2, 4, FALSE)
	if(target.sexcon.check_active_ejaculation())
		target.visible_message(span_love("[target] cums into [user]'s butt!"))
		target.sexcon.cum_into(anal = TRUE)
		target.virginity = FALSE

/datum/sex_action/npc_anal_ride_sex/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] gets off [target]."))
	var/mob/living/simple_animal/hostile/retaliate/rogue/usermob = user
	usermob.stoppedfucking(target)
	var/datum/sex_controller/sc = target.sexcon
	sc.beingfucked = FALSE

/datum/sex_action/npc_anal_ride_sex/is_finished(mob/living/user, mob/living/target)
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
