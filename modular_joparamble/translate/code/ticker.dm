/datum/controller/subsystem/ticker/get_end_reason()
	var/end_reason

	if(istype(SSticker.mode, /datum/game_mode/chaosmode))
		var/datum/game_mode/chaosmode/C = SSticker.mode
		if(C.check_for_lord)
			if(!C.check_for_lord(forced = TRUE))
				end_reason = pick("Без своего Лорда, они были обречены стать рабами Зизо.",
								"Без своего Лорда, они были обречены быть сожраными мерзкими тварями.",
								"Без своего Лорда, они были обречены стать жертва Геенны.",
								"Без своего Лорда, они были обречены насладиться своим массовым суицидом.",
								"Без своего Лорда, Древний Лич сделал их его своими игрушками.",
								"Без своего Лорда, завистливый соперник королевства стал править городом в тирании.",
								"Без своего Лорда, город был заброшен.")
//		if(C.not_enough_players)
//			end_reason = "The town was abandoned."

		if(C.vampire_werewolf() == "vampire")
			end_reason = "Когда Вампиры закончили высасывать город досуха, они покинули его и перешли к следующему."
		if(C.vampire_werewolf() == "werewolf")
			end_reason = "Оборотни сформировали нечествивый Клан, грабя город до конца его дней."

		if(C.cultascended)
			end_reason = "И в конце лишь доносилось 'ЗИЗО! ЗИЗО! ЗИЗО!'."

		if(C.headrebdecree)
			end_reason = "Крестьянское восстание захватило власть над троном. Да здравствует новое общество!"


	if(end_reason)
		to_chat(world, span_bigbold("[end_reason]."))
	else
		to_chat(world, span_bigbold("Городу удалось пережить очередную неделю."))

	send2chat(new /datum/tgs_message_content("...[end_reason] Вот и сказочке конец."), CONFIG_GET(string/chat_announce_new_game))

/datum/controller/subsystem/ticker/stats_report()
	var/list/shit = list()
	shit += "<br><span class='bold'>Δ--------------------Δ</span><br>"
	shit += "<br><font color='#9b6937'><span class='bold'>Смертей::</span></font> [deaths]"
	shit += "<br><font color='#af2323'><span class='bold'>Крови пролито::</span></font> [round(blood_lost / 100, 1)]L"
	shit += "<br><font color='#36959c'><span class='bold'>Триумфов получено:</span></font> [tri_gained]"
	shit += "<br><font color='#a02fa4'><span class='bold'>Триумфов украдено:</span></font> [tri_lost * -1]"
	shit += "<br><font color='#ffd4fd'><span class='bold'>Наслаждений:</span></font> [cums]"
	if(GLOB.confessors.len)
		shit += "<br><font color='#93cac7'><span class='bold'>Исповедники:</span></font> "
		for(var/x in GLOB.confessors)
			shit += "[x]"
	shit += "<br><br><span class='bold'>∇--------------------∇</span>"
	to_chat(world, "[shit.Join()]")
	send2chat(new /datum/tgs_message_content("[shit.Join]"), CONFIG_GET(string/chat_announce_new_game))
	return
