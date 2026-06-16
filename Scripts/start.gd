extends Node2D
@onready var CreditUI = $Control/VBoxContainer/CreditBtn/Panel

func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://Scenes/stage.tscn")

func _on_quit_btn_pressed():
	get_tree().quit()


func _on_credit_btn_pressed():
	if CreditUI.visible:
		CreditUI.visible = false
	else:
		CreditUI.visible = true
