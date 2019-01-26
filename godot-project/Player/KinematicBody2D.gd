extends KinematicBody2D

const MOTION_SPEED = 200
#var JOYPAD_SENSITIVITY = 5
const JOYPAD_DEADZONE = 0.50
var joypad_vec

# Used to inform the UI
signal deathSignal
signal staminaSignal

func _ready():
	joypad_vec = Vector2(0,0)


func _handleCollision(collision_info):
	print(collision_info.collider)
	joypad_vec = joypad_vec.bounce(collision_info.normal)
	# also reduce stamina
	get_parent().stamina -= 1.0
	print(get_parent().stamina)
	emit_signal("staminaSignal", get_parent().stamina)
	# Check if player is dead
	if (get_parent().stamina <= 0.0):
		print("Game Over - No Stamina")
		emit_signal("deathSignal")

		

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
		_handleCollision(collision_info)
		
