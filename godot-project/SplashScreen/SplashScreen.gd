extends Node2D

var timer
export var hidden = false
var gameStarted

func _ready():
	get_tree().paused = true
	gameStarted = false
	timer = Timer.new()
	timer.connect("timeout",self,"tick")
	add_child(timer)
	timer.wait_time = .75
	timer.start()
	startScreenVisible(false)

func startScreenVisible(value):
	get_parent().get_node("Obstacle").visible = value
	get_parent().get_node("UI/Node2D").visible = value

func tick():
	get_node("ButtonsAnim").nextFrame()
	get_node("KeyboardAnim").nextFrame()

func startGame():
	gameStarted = true
	get_node("Polygon2D").visible = false
	get_node("KeyboardAnim").visible = false
	get_node("ButtonsAnim").visible = false
	timer.stop()
	startScreenVisible(true)

# System level input
func _process(delta):
	if Input.is_action_pressed("ui_cancel"):
		get_tree().paused = true
	if Input.is_action_pressed("ui_accept"):
		get_tree().paused = false
		startGame()
	if Input.is_action_pressed("ui_quit"):
		get_tree().quit()
