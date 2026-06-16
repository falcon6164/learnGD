extends Control
signal UpgradeSelected()
@onready var options = 0
@export var maxoptions = 3
var OptionsInstance = preload("res://Scenes/LevelOptions.tscn")

func _ready():
	#升級時的顯示及動畫
	self.visible = false
	var tween = self.create_tween()
	tween.tween_property(self, "global_position", Vector2(0, 30), 0.3)

func _process(delta):
	pass

func QueueFree():
	print("Leveling UI Queue Free Called")
	
func GenerateOptions():
	#從 ArcherDB 複製過來的緩存
	var dblist = []
	
	for i in ArcherUpgradeDb.UPGRADES:
		dblist.append(i)

	#依照升級的DB 生成升級選項
	for options in maxoptions:
		if options < maxoptions:
			var pickedOption = dblist.pick_random()
			dblist.erase(pickedOption)
			var generatedOption = OptionsInstance.instantiate()
			generatedOption.item = pickedOption
			get_node("OptionsContainer").add_child(generatedOption)
			options += 1
