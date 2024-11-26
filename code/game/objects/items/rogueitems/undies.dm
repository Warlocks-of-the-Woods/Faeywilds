/obj/item/undies
	name = "briefs"
	desc = "An absolute necessity."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "briefs"
	resistance_flags = FLAMMABLE
	obj_flags = CAN_BE_HIT
	break_sound = 'sound/foley/cloth_rip.ogg'
	blade_dulling = DULLING_CUT
	max_integrity = 200
	integrity_failure = 0.1
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	var/gendered
	var/race
	var/datum/bodypart_feature/underwear/undies_feature
	var/covers_breasts = FALSE
	sewrepair = TRUE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/undies/attack(mob/M, mob/user, def_zone)
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.underwear)
			if(!get_location_accessible(H, BODY_ZONE_PRECISE_GROIN, skipundies = TRUE))
				return
			user.visible_message(span_notice("[user] tries to put [src] on [H]..."))
			if(do_after(user, 50, needhand = 1, target = H))
				var/obj/item/bodypart/chest = H.get_bodypart(BODY_ZONE_CHEST)
				chest.add_bodypart_feature(undies_feature)
				user.dropItemToGround(src)
				forceMove(H)
				H.underwear = src

/obj/item/undies/bikini
	name = "bikini"
	icon_state = "bikini"
	covers_breasts = TRUE

/obj/item/undies/panties
	name = "panties"
	icon_state = "panties"

/obj/item/undies/leotard
	name = "leotard"
	icon_state = "leotard"
	covers_breasts = TRUE
