extends Label

func _ready():
	pass
func _process(delta):
	text = "SCORE:" + str(Settings.score)
