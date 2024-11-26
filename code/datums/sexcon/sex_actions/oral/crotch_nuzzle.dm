/datum/sex_action/crotch_nuzzle
	name = "Nuzzle their crotch"
	check_incapacitated = FALSE

/datum/sex_action/crotch_nuzzle/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(HAS_TRAIT(target, TRAIT_TINY))	//Fairy too small to nuzzle, but can do nuzzling
		return FALSE
	return TRUE

/datum/sex_action/crotch_nuzzle/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(target))
		var/mob/living/carbon/human/targethuman = target
		if(targethuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = targethuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	return TRUE

/datum/sex_action/crotch_nuzzle/on_start(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] moves their head against [target]'s crotch..."))

/datum/sex_action/crotch_nuzzle/on_perform(mob/living/user, mob/living/target)
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] nuzzles [target]'s crotch..."))

	user.sexcon.perform_sex_action(target, 0.5, 0, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/crotch_nuzzle/on_finish(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] stops nuzzling [target]'s crotch..."))

/datum/sex_action/crotch_nuzzle/is_finished(mob/living/user, mob/living/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
