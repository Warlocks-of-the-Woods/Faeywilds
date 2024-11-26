/datum/sex_action/force_foot_lick
	name = "Force them to lick your feet"
	check_same_tile = FALSE
	require_grab = TRUE
	stamina_cost = 1.0

/datum/sex_action/force_foot_lick/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(HAS_TRAIT(user, TRAIT_TINY)) //Fairy is too small and weak to force this
		return FALSE
	return TRUE

/datum/sex_action/force_foot_lick/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	//booted uh... time.
	/*
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_L_FOOT))
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_R_FOOT))
		return FALSE
	*/
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/datum/sex_action/force_foot_lick/on_start(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] shoves their feet against [target]'s head!"))

/datum/sex_action/force_foot_lick/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] forces [target] to lick his feet."))
	target.make_sucking_noise()

/datum/sex_action/force_foot_lick/on_finish(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] pulls their feet away from [target]'s head."))
