/datum/sex_action/facesitting
	name = "Sit on their face"
	check_incapacitated = FALSE
	gags_target = TRUE

/datum/sex_action/facesitting/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	return TRUE

/datum/sex_action/facesitting/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = userhuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	// Need to stand up
	if(user.resting)
		return FALSE
	// Target can't stand up
	if(!target.resting)
		return FALSE
	return TRUE

/datum/sex_action/facesitting/on_start(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] sits their butt on [target]'s face!"))

/datum/sex_action/facesitting/on_perform(mob/living/user, mob/living/target)
	var/verbstring = pick(list("rubs", "smushes", "forces"))
	if(user.sexcon.do_message_signature("[type]"))
		user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] [verbstring] their butt against [target] face."))
	target.make_sucking_noise()
	do_thrust_animate(user, target)

	user.sexcon.perform_sex_action(user, 1, 3, TRUE)
	user.sexcon.handle_passive_ejaculation()

	user.sexcon.perform_deepthroat_oxyloss(target, 1.3)
	user.sexcon.perform_sex_action(target, 0, 2, FALSE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/facesitting/on_finish(mob/living/user, mob/living/target)
	..()
	user.visible_message(span_warning("[user] gets off [target]'s face."))

/datum/sex_action/facesitting/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE

/datum/sex_action/facesittingtwo
	name = "Sit on their face with cunt"

/datum/sex_action/facesittingtwo/shows_on_menu(mob/living/user, mob/living/target)
	if(!target.erpable && issimple(target))
		return FALSE
	if(user.client.prefs.defiant && issimple(target))
		return FALSE
	if(user == target)
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/facesittingtwo/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(ishuman(user))
		var/mob/living/carbon/human/userhuman = user
		if(userhuman.wear_pants)
			var/obj/item/clothing/under/roguetown/pantsies = userhuman.wear_pants
			if(pantsies.flags_inv & HIDECROTCH)
				if(!pantsies.genitalaccess)
					return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!user.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	// Need to stand up
	if(user.resting)
		return FALSE
	// Target can't stand up
	if(!target.resting)
		return FALSE
	return TRUE

/datum/sex_action/facesittingtwo/on_start(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] sits their cunt on [target]'s face!"))

/datum/sex_action/facesittingtwo/on_perform(mob/living/user, mob/living/target)
	var/verbstring = pick(list("rubs", "smushes", "forces"))
	user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] [verbstring] their cunt against [target] face."))
	target.make_sucking_noise()

	user.sexcon.perform_sex_action(user, 1, 3, TRUE)
	user.sexcon.handle_passive_ejaculation()

	user.sexcon.perform_deepthroat_oxyloss(target, 1.3)
	user.sexcon.perform_sex_action(target, 0, 2, FALSE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/facesittingtwo/on_finish(mob/living/user, mob/living/target)
	user.visible_message(span_warning("[user] gets off [target]'s face."))

/datum/sex_action/facesittingtwo/is_finished(mob/living/user, mob/living/target)
	if(user.sexcon.finished_check())
		return TRUE
	return FALSE
