//by vide noir
/mob/living/proc/play_overhead_indicator(icon_path, overlay_name, clear_time, overlay_layer)
	if(!ishuman(src))
		return
	if(stat != DEAD)
		var/mob/living/carbon/human/humie = src
		var/datum/species/species =	humie.dna.species
		var/mutable_appearance/appearance = mutable_appearance(icon_path, overlay_name, overlay_layer)
		appearance.appearance_flags = RESET_COLOR
		var/list/offset_list
		if(humie.gender == FEMALE)
			offset_list = species.offset_features[OFFSET_HEAD_F]
		else
			offset_list = species.offset_features[OFFSET_HEAD]
		if(offset_list)
			appearance.pixel_x += (offset_list[1])
			appearance.pixel_y += (offset_list[2]+12)
		overlays_standing[OBJ_LAYER] = appearance
		apply_overlay(OBJ_LAYER)

		addtimer(CALLBACK(humie, PROC_REF(clear_overhead_indicator), appearance), clear_time)

/mob/living/proc/clear_overhead_indicator(appearance)
	remove_overlay(OBJ_LAYER)
	cut_overlay(appearance, TRUE)
	qdel(appearance)
	update_icon()
	return

/mob/living/proc/play_stress_indicator()
	play_overhead_indicator('modular_stonehedge/icons/mob/overhead_effects.dmi', "stress", 10, OBJ_LAYER)
	playsound(src, 'modular_stonehedge/sound/ddstress.ogg', 100, FALSE, ignore_walls = FALSE)

/mob/living/proc/play_relief_indicator()
	play_overhead_indicator('modular_stonehedge/icons/mob/overhead_effects.dmi', "relief", 10, OBJ_LAYER)
	playsound(src, 'modular_stonehedge/sound/ddrelief.ogg', 100, FALSE, ignore_walls = FALSE)

/mob/living/proc/play_mental_break_indicator()
	play_overhead_indicator('modular_stonehedge/icons/mob/overhead_effects.dmi', "mentalbreak", 20, OBJ_LAYER)
	playsound(src, 'modular_stonehedge/sound/stressaffliction.ogg', 100, FALSE, ignore_walls = FALSE)
