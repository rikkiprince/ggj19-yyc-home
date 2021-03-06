# this is the player kinematic body
extends KinematicBody2D

const MOTION_SPEED = 200
const JOYPAD_DEADZONE = 0.6
var joypad_vec

# Used to inform the UI
signal deathSignal
signal staminaSignal
signal hitSignal

onready var startTime = OS.get_ticks_msec()


func _ready():
	joypad_vec = Vector2(0,0)
	add_to_group("player", true)

# Drain a tiny bit of stamina
func _process(delta):
	# if (in home):
	if(get_parent().healing):
		get_parent().stamina = min(get_parent().stamina + 0.5, get_parent().max_stamina)
		emit_signal("staminaSignal", get_parent().stamina)
	# if (not in home):
	else:
		get_parent().stamina = max(get_parent().stamina -0.10, 0.0)
		emit_signal("staminaSignal", get_parent().stamina)
	# Check if player is dead
	if (get_parent().stamina <= 0.0):
		print("Game Over - No Stamina")
		emit_signal("deathSignal")
		self.get_node("CollisionShape2D").disabled = true
		get_parent().center_of_home_vector = get_parent().last_visited_home.global_position

func _handleCollision(collision_info):
	print(collision_info.collider)
	joypad_vec = joypad_vec.bounce(collision_info.normal)
	
	if ((OS.get_ticks_msec() - startTime) > 500.0):
		startTime = OS.get_ticks_msec()	
		# Reduce stamina
		get_parent().stamina -= 5.0
		print(get_parent().stamina)
		emit_signal("hitSignal", get_parent().stamina)
		# Check if player is dead
		if (get_parent().stamina <= 0.0):
			print("Game Over - No Stamina")
			emit_signal("deathSignal")
			self.get_node("CollisionShape2D").disabled = true
			get_parent().center_of_home_vector = get_parent().last_visited_home.global_position
	
			

func _physics_process(delta):
	# get joy stick vector
	var newjoypad_vec = Vector2(Input.get_joy_axis(0, 0), Input.get_joy_axis(0, 1))

	# Only change the joypad_vec if it's outside the deadzone
	# no normalization
	# this means the player can speed up or go back to a slower speed
	if newjoypad_vec.length() > JOYPAD_DEADZONE:
		joypad_vec = newjoypad_vec


	var vec_delta = 0.05
	var vec_max = 0.5
	# Keyboard controls
	if (Input.is_key_pressed(KEY_A)): 
		joypad_vec.x = max(joypad_vec.x - vec_delta, -vec_max)
	if (Input.is_key_pressed(KEY_D)): 
		joypad_vec.x = min(joypad_vec.x + vec_delta, vec_max)
	if (Input.is_key_pressed(KEY_W)): 
		joypad_vec.y = max(joypad_vec.y - vec_delta, -vec_max)
	if (Input.is_key_pressed(KEY_S)): 
		joypad_vec.y = min(joypad_vec.y + vec_delta, vec_max)

	if newjoypad_vec.length() > JOYPAD_DEADZONE:
		joypad_vec = newjoypad_vec
	
	# gravitate into center of home once entered
	var center_of_home_vector = get_parent().center_of_home_vector
	if center_of_home_vector != null:
		var move_to_center_of_home_vec = center_of_home_vector - global_position
		if move_to_center_of_home_vec.length() < 2:
			get_parent().center_of_home_vector = null
			self.get_node("CollisionShape2D").disabled = false
			joypad_vec = Vector2(0,0)
		else:
			joypad_vec = move_to_center_of_home_vec.normalized()

	var collision_info = move_and_collide(joypad_vec * delta*MOTION_SPEED)
	if (collision_info != null):
		_handleCollision(collision_info)
