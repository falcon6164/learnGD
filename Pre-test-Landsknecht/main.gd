extends Node2D


func _ready():
	#Utils.saveGame()
	Utils.loadGame()
func _on_exit_btn_pressed():
	get_tree().quit()


func _on_play_btn_pressed():
	get_tree().change_scene_to_file("res://Global/Game.tscn")
