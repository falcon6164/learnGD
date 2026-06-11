extends ProgressBar
@onready var AttackTimer = get_parent().get_node("AttackTimer")
@onready var Player = get_parent()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	value += AttackTimer.wait_time * 100 * delta / AttackTimer.wait_time

func _on_archer_attack_ready():
	visible = false
	


func _on_archer_attack_fired():
	value = 0
	visible = true
