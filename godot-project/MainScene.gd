extends Node

func _ready():
	pass

func _process(delta):
	# Just a quick helper to close the game for now
	# Should pause and open a menu in the future
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().quit()
