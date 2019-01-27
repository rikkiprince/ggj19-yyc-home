extends Node2D
var hue = 0
func _ready():
	pass

func _process(delta):
	hue = hue + (delta/1.0)
	if (hue > 1):
		hue = 0
	get_node("Area2D/PowerUpPoly2D").color.r = hue
	
