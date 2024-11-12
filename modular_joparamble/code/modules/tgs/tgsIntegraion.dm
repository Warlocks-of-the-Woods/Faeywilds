/datum/tgs_chat_embed/provider/author/glob
	name = "Эйри Мэнн вещает"
	icon_url = "https://media.discordapp.net/attachments/1287095900103250030/1305984123621605386/faeywild-mini.jpg?ex=673503ff&is=6733b27f&hm=b7aec850ffc21a8edeb99f497c15ae2ac6b5303ec2a107ca576efbf3b1493226&format=webp&"

/world/TgsInitializationComplete()
	. = ..()
	var/list/randomline = list(
				"О-о-о? Что это? Начало игры?",
				"Это для меня? Начало игры?",
				"ИГРА НАЧАЛАСЬ! :)",
				"Давно-давно... Началась история, произошедшая на [SSmapping.config.map_name]",
				"Уэ. Новый раунд или что-то вроде того.",
				"Я всегда возвращаюсь вместе с новой партией.",
				"Мы начинаем новую партию!",
				"Мы начинаем новую партию!", //a hack to bump up the chances, yeah
				"Мы начинаем новую партию!",
				"Время для новой истории!",
				"Время для новой истории!",
				"Время для новой истории!",
				"Я должна признаться. Вы мои любимые слушатели.",
				"Тишина, дитя человеческое, у меня есть история для тебя...",
				"Партия начинается. Вы встретились в та...раске...",
				"Нет конца, нет конца, нет конца, нет конца...",
				"Убивать. Насиловать. Предавать.",
				"Пора начинать партию!",
				"Партия начинается. Вы встретились в таверне, мои чуваки.",
				",g Мы начали партию.",
				"Партия начинается, встречаемся в таверне.",
			)

	var/datum/tgs_message_content/message = new ("[CONFIG_GET(string/channel_announce_new_game_message)]")
	var/datum/tgs_chat_embed/structure/embed = new()
	message.embed = embed
	embed.title = "Начинается новая история!"
	embed.description = "[pick(randomline)]"
	embed.colour = "#e47b4a"
	embed.author = new /datum/tgs_chat_embed/provider/author/glob("Эйри Мэнн собирает игроков на сессию")
	//embed.media.thumbnail = "https://tenor.com/view/leaf-black-souls-black-souls-2-marry-ann-mary-sue-gif-9443358797381852725"

	send2chat(message, CONFIG_GET(string/chat_announce_new_game))

/world/TgsReboot()
	. = ..()
	var/datum/tgs_message_content/message = new ("...Вот и сказочки конец.")
	var/datum/tgs_chat_embed/structure/embed = new()
	message.embed = embed
	embed.author = new /datum/tgs_chat_embed/provider/author/glob("Эйри Мэнн объявляет результаты")
	embed.title = "Партия окончена."
	embed.description = "[SSticker.get_end_reason()]"
	embed.colour = "#fffb00"
	var/datum/tgs_chat_embed/field/deaths = new ("💀Смертьей: ", "[SSticker.deaths]")
	var/datum/tgs_chat_embed/field/bloodspilled = new ("🩸Крови пролито: ", "[round(SSticker.blood_lost / 100, 1)]L")
	var/datum/tgs_chat_embed/field/triumphgained = new ("🏆Триумфов получено: ", "[SSticker.tri_gained]")	//required field for roundend webhook!
	var/datum/tgs_chat_embed/field/triumphslost = new ("🐱‍👤Триумфов украдено:", "[SSticker.tri_lost*-1]")	//required field for roundend webhook!
	var/datum/tgs_chat_embed/field/pleasures = new ("💦Наслаждений: ", "[SSticker.cums]")
	var/datum/tgs_chat_embed/field/confessors = new ("☦Исповедники: ", "[GLOB.confessors.len]")
	var/datum/tgs_chat_embed/field/players = new ("👻Заблудшие души: ", "[GLOB.player_list.len]")	//players who didnt escape and aren't on the station.

	embed.fields = list(deaths, bloodspilled, triumphgained, triumphslost, pleasures, confessors, players)

	send2chat(message, CONFIG_GET(string/chat_announce_new_game))

