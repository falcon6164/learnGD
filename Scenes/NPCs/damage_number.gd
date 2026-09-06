extends Label
var type: String
var isCrit: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	#設定ARGS
	pass
	
	#TWEEN動畫
	var damageLabelTween = get_tree().create_tween()
	damageLabelTween.set_parallel(true)
	damageLabelTween.tween_property(self, "scale", Vector2(2, 0.7), 0.2)
	damageLabelTween.tween_property(self, "scale", Vector2(0.7, 0.7), 0.4)
	damageLabelTween.tween_property(self, "position:y", self.position.y - 20, 0.6)
	damageLabelTween.tween_property(self, "modulate:a", 0, 1.8)
	await damageLabelTween.finished
	queue_free()

func _process(delta):
	pass
