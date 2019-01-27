extends Node

var gameStarted

func _ready():
	gameStarted = false
	setGamePause(true)
	# show splash screen

func setGamePause(pause):
	get_node("UI/Node2D/TextureProgress").set_visible(!pause)
	var kids = get_children()
	for k in kids:
		# total hack, need to check if k.isNode instead or whatever
		if k.name != "Background" && k.name != "UI" && k.name != "Music" && k.name != "HitSound":
			k.set_visible(!pause)
	get_node("Player").get_node("KinematicBody2D").paused = pause
	get_node("SpikeyBoy").paused = pause
	if (!pause):
		gameStarted = true
	
func _process(delta):
	# Just a quick helper to close the game for now
	# Should pause and open a menu in the future
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()
	if Input.is_action_pressed("ui_accept"):
		setGamePause(false)
	if Input.is_action_pressed("ui_cancel"):
		setGamePause(true)
