extends Panel

@onready var NameLbl = $OptionName
@onready var DescText = $Desc
@onready var Icon = $ItemIcon
@onready var Player = get_tree().get_first_node_in_group("Player")

var mouseover: bool = false

signal UpgradePicked()

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("UpgradePicked", Callable(Player, "UpgradePicked"))
	
func _input(event):
	if event.is_action("Click"):
		if mouseover:
			emit_signal("UpgradePicked")

func _on_mouse_entered():
	mouseover = true


func _on_mouse_exited():
	mouseover = false
