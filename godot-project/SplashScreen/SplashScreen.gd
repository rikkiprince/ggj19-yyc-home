extends Node2D

var timer
export var hidden = false

func _ready():
	timer = Timer.new()
	timer.connect("timeout",self,"tick")
	add_child(timer)
	timer.wait_time = .75
	timer.start()

func tick():
	get_node("ButtonsAnim").nextFrame()
	get_node("KeyboardAnim").nextFrame()
