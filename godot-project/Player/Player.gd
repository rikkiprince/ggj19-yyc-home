extends Node2D

const MOTION_SPEED = 8000
#var JOYPAD_SENSITIVITY = 5
const JOYPAD_DEADZONE = 0.30

#func _ready():
#	pass

func _physics_process(delta):
	var joypad_vec = Vector2(0, 0)
	
	joypad_vec = Vector2(Input.get_joy_axis(0, 0), Input.get_joy_axis(0, 1))
	
	if joypad_vec.length() < JOYPAD_DEADZONE:
		joypad_vec = Vector2(0, 0)
	else:
		joypad_vec = joypad_vec.normalized() * ((joypad_vec.length() - JOYPAD_DEADZONE) / (1 - JOYPAD_DEADZONE))
	get_node("KinematicBody2D").move_and_slide(joypad_vec*delta*MOTION_SPEED)
