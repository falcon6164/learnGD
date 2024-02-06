extends Node2D

var beer = preload("res://Collectables/beer.tscn")

func _on_collectables_spawner_timeout():
	var beerTemp = beer.instantiate()
	var rng = RandomNumberGenerator.new()
	var ranint = rng.randi_range(300,1150)
	beerTemp.position = Vector2(ranint, 275)
	add_child(beerTemp)
