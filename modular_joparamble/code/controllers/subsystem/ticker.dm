/datum/controller/subsystem/ticker/checkreqroles()
	//goonwood edits to ticker to make ruler a required role
	if(start_immediately == TRUE)
		return TRUE
	var/ruler = FALSE
	//don't need those... for now.
	/*
	var/merchant = FALSE
	var/priest = FALSE
	*/
	var/jobs_required = "Герцог" // this is for final message only. This doesn't do anything on it's own

	var/players = GLOB.player_list.len

	for(var/i in GLOB.new_player_list)
		var/mob/dead/new_player/player = i
		if(!player || !(player.ready))
			continue
		for(var/j)
		if((player.client.prefs.job_preferences["Duke"] == JP_HIGH) || (player.client.prefs.job_preferences["Duchess"] == JP_HIGH))
			if((player.IsJobUnavailable("Duke") != JOB_AVAILABLE) && (player.IsJobUnavailable("Duchess") != JOB_AVAILABLE)) // fuck you irvin
				ruler = TRUE
		/*Future proofing. Sort of.
		if(player.mind.assigned_role == "Merchant")
			merchant = TRUE
		if((player.mind.assigned_role == "Priest") || (player.mind.assigned_role == "Priestess"))
			ruler = TRUE
		*/
		if(ruler)
			return TRUE

	

#ifdef DEPLOY_TEST
	ruler = TRUE
	//merchant = TRUE
	//priest = TRUE
#endif
#ifdef ROGUEWORLD
	ruler = TRUE
	//merchant = TRUE
	//priest = TRUE
#endif

	if(players<10)
		var/list/stuffy = list("Зизо проклинает вас на жизнь в этом пустом мире.","вы будете жить в мире собственных ошибок.","вы остаетесь подумать, зачем вы в этом пустом мире.","вы отпускаетесь вместе со своим одиночеством.","вы отправляетесь вместе со своим одиночеством в свободное плавание.")
		to_chat(world,"<span class='notice'>Правитель требуется для начала раунда... однако так как в мире всего [players] душ, [pick(stuffy)]</span>")
	else
		if(!ruler)
			var/list/stuffy = list(
				"Поставь [jobs_required]а, на 'хай' в своем преференсе, чтобы партия могла начаться!",
				"ПОИГРАЙ ЗА [jobs_required]а СЕЙЧАС ЖЕ!", 
				"[jobs_required] требуется для начала партии.",
				"Молись на [jobs_required]а.",
				"Однажды, избранный [jobs_required] появится.", 
				"Просто ПОПРОБУЙ поиграть на [jobs_required]а.",
				"Если ты не захочешь играть за [jobs_required]а, то партия просто не начнется.",
				"Нам нужен хотя бы один [jobs_required] для начала партии.", 
				"Мы все ждем пока ТЫ выберешь [jobs_required]а для старта партии.", 
				"И все так же нет [jobs_required]а...", 
				"Я сейчас сойду с ума, если [jobs_required] не появится среди готовых персонажей!",
				"Нет. Игра просто не начнется, просто потому что никто не хочет быть [jobs_required]ом.",
				"Партия не начнется, пока у ДМа не будет листа [jobs_required]а.",
				"Какой вообще смысл приключения, если нет [jobs_required]а?!", 
				"НИГГЕРЫ ГДЕ [jobs_required]?!",
				"Псидон отвернулся от вас, потому что вы не выбрали [jobs_required]."
			)
			to_chat(world, "<span class='notice'>[pick(stuffy)]</span>")
			return FALSE
	
	job_change_locked = TRUE
	return TRUE

/datum/controller/subsystem/ticker/setup()
	. = ..()
	var/sendgif = "https://tenor.com/view/leaf-black-souls-black-souls-2-marry-ann-mary-sue-gif-9443358797381852725"
	var/list/stuffy = list(
				"О-о-о? Что это? Начало игры?",
				"Это для меня? Начало игры?",
				"ИГРА НАЧАЛАСЬ! :)",
				"Давно-давно... Началась история, произошедшая на [SSmapping.config.map_name]",
				"Уэ. Новый раунд или что-то вроде того.",
				"Я всегда возвращаюсь вместе с новой партией.",
				"Мы начинаем!",
				"Стартуем!",
				"Пора начинать партию!",
				"Партия начинается. Вы встретились в таверне, мои чуваки.",
				",g Мы начали партию.",
				"Партия начинается, встречаемся в таверне.",
			)
	send2chat(new /datum/tgs_message_content("[sendgif] [pick(stuffy)]"), CONFIG_GET(string/chat_announce_new_game))
