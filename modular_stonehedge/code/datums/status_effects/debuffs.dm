//Bloat
//added and removed by filling_organs
/datum/status_effect/debuff/bloatone
	id = "bloatone"
	alert_type = /atom/movable/screen/alert/status_effect/bloatone
	effectedstats = list("constitution" = 1, "speed" = -1)

/atom/movable/screen/alert/status_effect/bloatone
	name = "Bloated"
	desc = "Bit full..."
	icon = 'modular_stonehedge/icons/mob/screen_alert.dmi'
	icon_state = "bloat1"

/datum/status_effect/debuff/bloattwo
	id = "bloattwo"
	alert_type = /atom/movable/screen/alert/status_effect/bloattwo
	examine_text = span_notice("Their belly is bulging...")
	effectedstats = list("constitution" = 2, "speed" = -2)

/atom/movable/screen/alert/status_effect/bloattwo
	name = "Bloated"
	desc = "So full..."
	icon = 'modular_stonehedge/icons/mob/screen_alert.dmi'
	icon_state = "bloat2"
