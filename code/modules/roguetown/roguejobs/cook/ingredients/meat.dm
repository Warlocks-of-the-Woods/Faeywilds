
/obj/item/reagent_containers/food/snacks/rogue/saltfish/CheckParts(list/parts_list, datum/crafting_recipe/R)
	for(var/obj/item/reagent_containers/food/snacks/M in parts_list)
		icon_state = "[initial(M.icon_state)]dried"
		qdel(M)

/obj/item/reagent_containers/food/snacks/rogue/meat/drakianwing
	name = "descaled drakian wing"
	icon_state = "chickencutlet"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/drakianwing/cooked
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/drakianwing/cooked

/obj/item/reagent_containers/food/snacks/rogue/meat/drakianwing/cooked
	eat_effect = /datum/status_effect/buff/foodbuff
	slices_num = 0
	name = "fried drakian wing"
	desc = "A spicy wing from a dragon... Too small to come from a wyvern, though..?"
	icon_state = "drakianwing"
	list_reagents = list(/datum/reagent/consumable/nutriment = 15, /datum/reagent/consumable/capsaicin = 10)
	bitesize = 5

/obj/item/reagent_containers/food/snacks/rogue/meat/sisseantail
	name = "descaled sissean tail"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "lizardtail"
	color = "#fbb0b0"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/sisseantail/cooked
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/sisseantail/cooked

/obj/item/reagent_containers/food/snacks/rogue/meat/sisseantail/cooked
	eat_effect = /datum/status_effect/buff/foodbuff
	slices_num = 0
	name = "fried sissean tail"
	desc = "A delectable sissean tail. Tastes like chicken."
	color = "#946114"
	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/rogue/meat/koboldtail
	name = "descaled kobold tail"
	icon = 'icons/obj/surgery.dmi'
	icon_state = "koboldtail"
	color = "#fbb0b0"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/meat/koboldtail/cooked
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/meat/koboldtail/cooked

/obj/item/reagent_containers/food/snacks/rogue/meat/koboldtail/cooked
	eat_effect = /datum/status_effect/buff/foodbuff
	slices_num = 0
	name = "fried kobold tail"
	desc = "A delectable kobold tail. Tastes like chicken."
	color = "#946114"
	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
	bitesize = 3

/obj/item/reagent_containers/food/snacks/rogue/meat/pate
	eat_effect = /datum/status_effect/buff/foodbuff
	slices_num = 0
	name = "pate"
	icon_state = "pate"
	desc = "A forcemeat with a prominent flavor of liver."
	list_reagents = list(/datum/reagent/consumable/nutriment = 15)
	bitesize = 3
