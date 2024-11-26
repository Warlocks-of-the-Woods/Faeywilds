/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/poultry
	name = "pot pie"
	tastes = list("chicken" = 1)

/datum/crafting_recipe/roguetown/cooking/eggpie
	name = "egg pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/egg = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/egg = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/egg


/obj/item/reagent_containers/food/snacks/rogue/pie/egg
	name = "egg pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/egg
	eat_effect = /datum/status_effect/debuff/uncookedfood

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/egg
	name = "egg pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("eggs" = 1)

/datum/crafting_recipe/roguetown/cooking/pearpie
	name = "pear pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/pear = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/pear = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/pear

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/pear
	name = "pear pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("pears" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/pear
	name = "pear pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/pear
	eat_effect = /datum/status_effect/debuff/uncookedfood

/datum/crafting_recipe/roguetown/cooking/cherrypie
	name = "cherry pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/cherry = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/cherry = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/cherry

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/cherry
	name = "cherry pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("cherries" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/cherry
	name = "cherry pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/cherry
	eat_effect = /datum/status_effect/debuff/uncookedfood

/datum/crafting_recipe/roguetown/cooking/cabbagepie
	name = "cabbage pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/cabbage = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/cabbage = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/cabbage

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/cabbage
	name = "cabbage pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("cabbages" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/cabbage
	name = "cabbage pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/cabbage
	eat_effect = /datum/status_effect/debuff/uncookedfood

/datum/crafting_recipe/roguetown/cooking/onionpie
	name = "onion pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/onion = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/onion = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/onion

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/onion
	name = "onion pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("onions" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/onion
	name = "onion pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/onion
	eat_effect = /datum/status_effect/debuff/uncookedfood

/datum/crafting_recipe/roguetown/cooking/carrotpie
	name = "carrot pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/carrot = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/carrot = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/carrot

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/carrot
	name = "carrot pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("carrots" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/carrot
	name = "carrot pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/carrot
	eat_effect = /datum/status_effect/debuff/uncookedfood

/datum/crafting_recipe/roguetown/cooking/radishpie
	name = "radish pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/radish = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/radish = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/radish

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/radish
	name = "radish pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("radishes" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/radish
	name = "radish pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/radish
	eat_effect = /datum/status_effect/debuff/uncookedfood

/datum/crafting_recipe/roguetown/cooking/rocknutpie
	name = "rocknut pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/nut = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/nut = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/rocknut

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/rocknut
	name = "rocknut pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("nutty" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/rocknut
	name = "rocknut pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/rocknut
	eat_effect = /datum/status_effect/debuff/uncookedfood

/datum/crafting_recipe/roguetown/cooking/plumphelmetpie
	name = "plump helmet pie"
	reqs = list(
		/obj/item/reagent_containers/food/snacks/grown/plumphelmet = 3,
		/obj/item/reagent_containers/food/snacks/rogue/piedough = 1)
	parts = list(
		/obj/item/reagent_containers/food/snacks/grown/plumphelmet = 3)
	result = /obj/item/reagent_containers/food/snacks/rogue/pie/plumphelmet

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/plumphelmet
	name = "plump helmet pie"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = 30)
	eat_effect = /datum/status_effect/buff/foodbuff
	tastes = list("the mountainhome" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pie/plumphelmet
	name = "plump helmet pie"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/plumphelmet
	eat_effect = /datum/status_effect/debuff/uncookedfood
