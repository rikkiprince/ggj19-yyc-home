extends KinematicBody2D

const MOTION_SPEED = 200
#var JOYPAD_SENSITIVITY = 5
const JOYPAD_DEADZONE = 0.50
var joypad_vec

func _ready():
	joypad_vec = Vector2(0,0)

func _physics_process(delta):
#	if collision_info:
#		velocity = velocity.bounce(collision_info.normal)
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

#	move_and_slide(joypad_vec*delta*MOTION_SPEED)
	var collision_info = move_and_collide(joypad_vec * delta*MOTION_SPEED)
	# this currently bounces off everything, should be just obstacles
	if (collision_info != null):
		print(collision_info.collider)
		joypad_vec = joypad_vec.bounce(collision_info.normal)
		# also reduce stamina
		
