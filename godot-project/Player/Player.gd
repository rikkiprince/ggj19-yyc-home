extends Node2D

const MOTION_SPEED = 8000

func _ready():
	pass

func _physics_process(delta):
	var motion = Vector2()
	if Input.get_joy_axis(0,
	if Input.is_action_pressed("ui_up"):
		motion += Vector2(0, -1)
	if Input.is_action_pressed("ui_down"):
		motion += Vector2(0, 1)
	if Input.is_action_pressed("ui_left"):
		motion += Vector2(-1, 0)
	if Input.is_action_pressed("ui_right"):
		motion += Vector2(1, 0)
	if Input.is_action_pressed("ui_accept"):
		print("button A")
	if Input.is_action_pressed("ui_cancel"):
		print("button B")
	motion = motion.normalized() * MOTION_SPEED * delta
	get_node("KinematicBody2D").move_and_slide(motion)
