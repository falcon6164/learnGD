extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		Settings.score += 1
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		print ("beer spawned")
		tween.tween_property(self, "position", position - Vector2(0, 50), 0.5)
		tween1.tween_property(self, "modulate:a", 0, 0.3)
		tween.tween_callback(queue_free)
