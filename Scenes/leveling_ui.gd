extends Control
signal UpgradeSelected()
@onready var options = 0
@onready var maxoptions = 3
var OptionsInstance = preload("res://Scenes/LevelOptions.tscn")

func _ready():
	#依照升級的DB 生成升級選項
	for options in maxoptions:
		if options < maxoptions:
			get_node("OptionsContainer").add_child(OptionsInstance.instantiate())
			options += 1
		else:
			pass
	#升級時的顯示及動畫
	self.visible = false
	var tween = self.create_tween()
	tween.tween_property(self, "position", Vector2(0, 30), 0.3)


func _process(delta):
	pass

func QueueFree():
	print("Leveling UI Queue Free Called")
