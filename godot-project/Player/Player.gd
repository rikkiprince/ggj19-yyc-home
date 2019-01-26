extends Node2D

const MOTION_SPEED = 8000
#var JOYPAD_SENSITIVITY = 5
const JOYPAD_DEADZONE = 0.50
var joypad_vec

func _ready():
	joypad_vec = Vector2(0,0)

func _physics_process(delta):
	var newjoypad_vec = Vector2(Input.get_joy_axis(0, 0), Input.get_joy_axis(0, 1))

	# Only change the joypad_vec if it's outside the deadzone
	# no normalization
	# this means the player can speed up or go back to a slower speed
	if newjoypad_vec.length() > JOYPAD_DEADZONE:
		joypad_vec = newjoypad_vec

	# Only change the joypad_vec if it's outside the deadzone
#	if newjoypad_vec.length() > JOYPAD_DEADZONE:
		# kinda janky but this code is the reason
#		joypad_vec = newjoypad_vec.normalized() * ((newjoypad_vec.length() - JOYPAD_DEADZONE) / (1 - JOYPAD_DEADZONE))

	get_node("KinematicBody2D").move_and_slide(joypad_vec*delta*MOTION_SPEED)
