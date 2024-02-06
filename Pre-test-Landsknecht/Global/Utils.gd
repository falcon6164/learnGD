extends Node

const SAVE_PATH = "res://savegame.bin"

func saveGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.WRITE)
	var data: Dictionary = {
		"playerHP": Settings.playerHP,
		"score": Settings.score, 
	}
	var jstr = JSON.stringify(data)
	file.store_line(jstr)
func loadGame():
	var file = FileAccess.open(SAVE_PATH, FileAccess.READ)
	if FileAccess.file_exists((SAVE_PATH)) == true:
		if not file.eof_reached():
			var current_line = JSON.parse_string(file.get_line())
			if current_line:
				Settings.playerHP = current_line["playerHP"]
				Settings.score = current_line["score"]
	file.close
