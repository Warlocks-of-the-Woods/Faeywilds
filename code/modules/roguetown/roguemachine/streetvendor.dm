#define DRUGRADE_MONEYA				(1<<0)
#define DRUGRADE_MONEYB 	      	(1<<1)
#define DRUGRADE_NOTAX				(1<<5)

/obj/structure/roguemachine/streetvendor
	name = "WANDERER"
	desc = "You want to buy nice things."
	icon = 'icons/roguetown/misc/machines.dmi'
	icon_state = "streetvendor1"
	density = TRUE
	blade_dulling = DULLING_BASH
	max_integrity = 0
	anchored = TRUE
	layer = BELOW_OBJ_LAYER
	var/list/held_items = list()
	var/locked = FALSE
	var/budget = 0
	var/secret_budget = 0
	var/recent_payments = 0
	var/last_payout = 0
	var/drugrade_flags

/obj/structure/roguemachine/streetvendor/attackby(obj/item/P, mob/user, params)
	if(istype(P, /obj/item/roguekey))
		var/obj/item/roguekey/K = P
		if(K.lockid == "merchant")
			locked = !locked
			playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			update_icon()
			return attack_hand(user)
		else
			to_chat(user, span_warning("Wrong key."))
			return
	if(istype(P, /obj/item/storage/keyring))
		var/obj/item/storage/keyring/K = P
		for(var/obj/item/roguekey/KE in K.keys)
			if(KE.lockid == "merchant")
				locked = !locked
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
				update_icon()
				return attack_hand(user)
	if(istype(P, /obj/item/roguecoin))
		budget += P.get_real_price()
		qdel(P)
		update_icon()
		playsound(loc, 'sound/misc/machinevomit.ogg', 100, TRUE, -1)
		return attack_hand(user)
	..()

/obj/structure/roguemachine/streetvendor/process()
	if(recent_payments)
		if(world.time > last_payout + rand(6 MINUTES,8 MINUTES))
			var/amt = recent_payments * 0.25
			if(drugrade_flags & DRUGRADE_MONEYA)
				amt = recent_payments * 0.50
			if(drugrade_flags & DRUGRADE_MONEYB)
				amt = recent_payments * 0.75
			recent_payments = 0
			send_ooc_note("<b>Income from HAGGLER:</b> [amt]", job = "Merchant")
			secret_budget += amt

/obj/structure/roguemachine/streetvendor/Topic(href, href_list)
	. = ..()
	if(!ishuman(usr))
		return
	if(href_list["buy"])
		if(!usr.canUseTopic(src, BE_CLOSE) || locked)
			return
		var/mob/M = usr
		var/O = text2path(href_list["buy"])
		if(held_items[O]["PRICE"])
			var/tax_amt = round(SStreasury.tax_value * held_items[O]["PRICE"])
			var/full_price = held_items[O]["PRICE"] + tax_amt
			if(drugrade_flags & DRUGRADE_NOTAX)
				full_price = held_items[O]["PRICE"]
			if(budget >= full_price)
				budget -= full_price
				recent_payments += held_items[O]["PRICE"]
				if(!(drugrade_flags & DRUGRADE_NOTAX))
					SStreasury.give_money_treasury(tax_amt, "HAGGLER import tax")
			else
				say("Not enough!")
				return
		var/obj/item/I = new O(get_turf(src))
		M.put_in_hands(I)
	if(href_list["change"])
		if(!usr.canUseTopic(src, BE_CLOSE) || locked)
			return
		if(budget > 0)
			budget2change(budget, usr)
			budget = 0
	if(href_list["secrets"])
		if(!usr.canUseTopic(src, BE_CLOSE) || locked)
			return
		var/list/options = list()
		options += "Withdraw Cut"
		if(drugrade_flags & DRUGRADE_NOTAX)
			options += "Enable Paying Taxes"
		else
			options += "Stop Paying Taxes"
		if(!(drugrade_flags & DRUGRADE_MONEYA))
			options += "Unlock 50% Cut (30)"
		else
			if(!(drugrade_flags & DRUGRADE_MONEYB))
				options += "Unlock 75% Cut (55)"
		var/select = input(usr, "Please select an option.", "", null) as null|anything in options
		if(!select)
			return
		if(!usr.canUseTopic(src, BE_CLOSE) || locked)
			return
		switch(select)
			if("Withdraw Cut")
				options = list("To Bank", "Direct")
				select = input(usr, "Please select an option.", "", null) as null|anything in options
				if(!select)
					return
				if(!usr.canUseTopic(src, BE_CLOSE) || locked)
					return
				switch(select)
					if("To Bank")
						var/mob/living/carbon/human/H = usr
						SStreasury.generate_money_account(secret_budget, H)
						secret_budget = 0
					if("Direct")
						if(secret_budget > 0)
							budget2change(secret_budget, usr)
							secret_budget = 0
			if("Enable Paying Taxes")
				drugrade_flags &= ~DRUGRADE_NOTAX
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			if("Stop Paying Taxes")
				drugrade_flags |= DRUGRADE_NOTAX
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			if("Unlock 50% Cut (30)")
				if(drugrade_flags & DRUGRADE_MONEYA)
					return
				if(budget < 30)
					say("Ask again when you're serious.")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				budget -= 30
				drugrade_flags |= DRUGRADE_MONEYA
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
			if("Unlock 75% Cut (55)")
				if(drugrade_flags & DRUGRADE_MONEYB)
					return
				if(budget < 55)
					say("Ask again when you're serious.")
					playsound(src, 'sound/misc/machinetalk.ogg', 100, FALSE, -1)
					return
				budget -= 55
				drugrade_flags |= DRUGRADE_MONEYB
				playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	return attack_hand(usr)

/obj/structure/roguemachine/streetvendor/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return
	if(!ishuman(user))
		return
	if(locked)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	playsound(loc, 'sound/misc/beep.ogg', 100, FALSE, -1)
	var/canread = user.can_read(src, TRUE)
	var/contents
	if(canread)
		contents = "<center>HAGGLER - In the name of pleasure.<BR>"
		contents += "<a href='?src=[REF(src)];change=1'>MAMMON LOADED:</a> [budget]<BR>"
	else
		contents = "<center>[stars("HAGGLER - In the name of pleasure.")]<BR>"
		contents += "<a href='?src=[REF(src)];change=1'>[stars("MAMMON LOADED:")]</a> [budget]<BR>"


	var/mob/living/carbon/human/H = user
	if(H.job == "Merchant")
		if(canread)
			contents += "<a href='?src=[REF(src)];secrets=1'>Secrets</a>"
		else
			contents += "<a href='?src=[REF(src)];secrets=1'>[stars("Secrets")]</a>"

	contents += "</center><BR>"

	for(var/I in held_items)
		var/price = held_items[I]["PRICE"] + (SStreasury.tax_value * held_items[I]["PRICE"])
		var/namer = held_items[I]["NAME"]
		if(!price)
			price = "0"
		if(!namer)
			held_items[I]["NAME"] = "thing"
			namer = "thing"
		if(canread)
			contents += "[icon2html(I, user)] [namer] - [price] <a href='?src=[REF(src)];buy=[I]'>BUY</a>"
		else
			contents += "[icon2html(I, user)] [stars(namer)] - [stars(price)] <a href='?src=[REF(src)];buy=[I]'>[stars("BUY")]</a>"
		contents += "<BR>"

	var/datum/browser/popup = new(user, "VENDORTHING", "", 370, 400)
	popup.set_content(contents)
	popup.open()

/obj/structure/roguemachine/streetvendor/obj_break(damage_flag)
	..()
	budget2change(budget)
	set_light(0)
	update_icon()
	icon_state = "streetvendor0"

/obj/structure/roguemachine/streetvendor/update_icon()
	cut_overlays()
	if(obj_broken)
		set_light(0)
		return
	set_light(1, 1, "#1b7bf1")
	add_overlay(mutable_appearance(icon, "vendor-drug"))


/obj/structure/roguemachine/streetvendor/Destroy()
	set_light(0)
	STOP_PROCESSING(SSroguemachine, src)
	return ..()

/obj/structure/roguemachine/streetvendor/Initialize()
	. = ..()
	START_PROCESSING(SSroguemachine, src)
	update_icon()
	held_items[/obj/item/storage/box/matches] = list("PRICE" = 8,"NAME" = "matches")
	held_items[/obj/item/storage/keyring			] = list("PRICE" = 5,"NAME" = "keyring")
	held_items[/obj/item/needle				] = list("PRICE" = 10,"NAME" = "needle")
	held_items[/obj/item/flint				] = list("PRICE" = 10,"NAME" = "flint")
	held_items[/obj/item/paper/scroll		] = list("PRICE" = 3,"NAME" = "scroll")
	held_items[/obj/item/storage/roguebag	] = list("PRICE" = 5,"NAME" = "sack")
	held_items[/obj/item/rope				] = list("PRICE" = 5,"NAME" = "rope")
	held_items[/obj/item/scomstone			] = list("PRICE" = 50,"NAME" = "scom ring")
	held_items[/obj/item/rogueweapon/huntingknife/idagger] = list("PRICE" = 20,"NAME" = "knife")
	held_items[/obj/item/reagent_containers/glass/bottle/rogue/healthpot] = list("PRICE" = 15,"NAME" = "red")
	held_items[/obj/item/reagent_containers/glass/bottle/rogue/manapot] = list("PRICE" = 13,"NAME" = "manna")
	held_items[/obj/item/reagent_containers/glass/bottle/rogue/antipregnancy] = list("PRICE" = 10,"NAME" = "pregnancy remover")
	held_items[/obj/item/reagent_containers/food/snacks/rogue/meat/coppiette] = list("PRICE" = 10,"NAME" = "coppiette")
	held_items[/obj/item/reagent_containers/food/snacks/rogue/honey] = list("PRICE" = 15,"NAME" = "honey")
	held_items[/obj/item/reagent_containers/food/snacks/butter] = list("PRICE" = 5,"NAME" = "butter")

#undef DRUGRADE_MONEYA
#undef DRUGRADE_MONEYB
#undef DRUGRADE_NOTAX
