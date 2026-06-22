extends Node2D
@onready var CreditUI = $Control/VBoxContainer/CreditBtn/Panel
var CreditMouseOver: bool = false

func _input(event):
	if Input.is_action_just_released("Attack"):
		if CreditUI.visible and CreditMouseOver == false:
			CreditUI.visible = false
func _on_start_btn_pressed():
	get_tree().change_scene_to_file("res://Scenes/stage.tscn")

func _on_quit_btn_pressed():
	get_tree().quit()


func _on_credit_btn_pressed():
	if CreditUI.visible:
		CreditUI.visible = false
	else:
		CreditUI.visible = true


func _on_credit_btn_mouse_entered():
	CreditMouseOver = true


func _on_credit_btn_mouse_exited():
	CreditMouseOver = false
