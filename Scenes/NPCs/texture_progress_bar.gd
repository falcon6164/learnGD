extends TextureProgressBar

@onready var AttackTimer = get_parent().get_node("AttackTimer")
@onready var Player = get_parent()

func _process(delta):
	value += (max_value / AttackTimer.wait_time) * delta

func _on_archer_attack_ready():
	visible = false

func _on_archer_attack_fired():
	value = 0
	visible = true
