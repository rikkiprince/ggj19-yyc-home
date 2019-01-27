extends Node2D

const MOTION_SPEED = 8000
#var JOYPAD_SENSITIVITY = 5
const JOYPAD_DEADZONE = 0.50
var joypad_vec
var stamina
var healing
var center_of_home_vector = null
var last_visited_home = null

export var max_stamina = 10

export var max_object_capacity = 1
var carried_objects = []

signal change_max_stamina_bar

func _ready():
	joypad_vec = Vector2(0,0)
	stamina = max_stamina
	emit_signal("change_max_stamina_bar", max_stamina)

# handle collection of pickup objects
func pick_up_object(object, type):
	if(len(carried_objects) >= max_object_capacity):
		print("carrying too many objects!")
		return false
	
	print("picked up "+str(type))
	carried_objects.append(type)
	get_parent().get_node("PickUpSound").play()
	return true

# handle delivering picked up objects to Home
func drop_object():
	var temp = carried_objects
	carried_objects = []
	if(len(temp) > 0):
		max_stamina += len(temp)*10
		emit_signal("change_max_stamina_bar", max_stamina)
		last_visited_home.scale.x += 1
		last_visited_home.scale.y += 1
		get_parent().get_node("DropSound").play()
	return temp
