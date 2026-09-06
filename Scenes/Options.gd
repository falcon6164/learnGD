extends Panel

@onready var NameLbl = $OptionName
@onready var DescText = $Desc
@onready var Icon = $ItemIcon
@onready var Player = get_tree().get_first_node_in_group("Player")

var item = null
var mouseover: bool = false

signal UpgradePicked(upgrade: String)

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("UpgradePicked", Callable(Player, "UpgradePicked"))
	
	if item == null:
		item = "StrongBow"
	NameLbl.text = ArcherUpgradeDb.UPGRADES[item]["displayname"]
	DescText.text = ArcherUpgradeDb.UPGRADES[item]["description"]
	Icon.texture = load(ArcherUpgradeDb.UPGRADES[item]["icon"])
	
func _input(event):
	if event.is_action_released("Click"):
		if mouseover:
			emit_signal("UpgradePicked", NameLbl.text)
			print(Player)

func _on_mouse_entered():
	mouseover = true
	print("Mouse Over Option: ", self)


func _on_mouse_exited():
	mouseover = false
	print("Mouse Exited Option: ", self)
	
