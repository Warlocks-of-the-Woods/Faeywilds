/obj/item/reagent_containers/glass/bucket/pot
	force = 10
	throwforce = 15
	name = "pot"
	desc = "A sturdy pot." // glass/pot doesn't mean it's made of glass dingus
	icon_state = "pot"
	icon = 'icons/roguetown/items/cooking.dmi'
	item_state = "paintcan"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	sharpness = IS_BLUNT
	obj_flags = CAN_BE_HIT
	w_class = WEIGHT_CLASS_BULKY
	reagent_flags = OPENCONTAINER
	throwforce = 10
	volume = 99
	reagent_flags = OPENCONTAINER
	spillable = TRUE
	possible_item_intents = list(INTENT_GENERIC, /datum/intent/fill, INTENT_POUR, INTENT_SPLASH)
	drop_sound = 'sound/foley/dropsound/shovel_drop.ogg'
	slot_flags = null

/obj/item/reagent_containers/glass/bucket/pot/stone
	name = "stone pot"
	desc = "A shabby small stone pot."
	w_class = WEIGHT_CLASS_NORMAL
	volume = 40
