extends Node

var gameStarted

func _ready():
	gameStarted = false
	# show splash screen

func _process(delta):
	# Just a quick helper to close the game for now
	# Should pause and open a menu in the future
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()
#	if Input.is_action_pressed("ui_accept"):
#		setGamePause(false)
#	if Input.is_action_pressed("ui_cancel"):
#		setGamePause(true)
