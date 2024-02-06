extends Timer

var beer = preload("res://Collectables/beer.tscn")

func _on_timeout():
	var beerTemp = beer.instantiate()
	var rng = RandomNumberGenerator.new()
	var ranint = rng.randi_range(10,400)
	beerTemp.position = Vector2(ranint, 20)
	add_child(beerTemp)
