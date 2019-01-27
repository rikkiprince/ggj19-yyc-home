extends Node2D

const MOTION_SPEED = 8000
#var JOYPAD_SENSITIVITY = 5
const JOYPAD_DEADZONE = 0.50
var joypad_vec
var stamina
var healing
var center_of_home_vector = null

export var max_object_capacity = 1
var carried_objects = []

func _ready():
	joypad_vec = Vector2(0,0)
	stamina = 100



	
func _physics_process(delta):
	pass

func pick_up_object(object, type):
	if(len(carried_objects) >= max_object_capacity):
		print("carrying too many objects!")
		return false
	
	print("picked up "+str(type))
	carried_objects.append(type)
	get_parent().get_node("PickUpSound").play()
	return true

func drop_object():
	var temp = carried_objects
	carried_objects = []
	if(len(temp) > 0):
		get_parent().get_node("DropSound").play()
	return temp

func _on_Area2D_body_entered(body):
	print("Heal")
	healing = true;

func _on_Area2D_body_exited(body):
	print("Exit Heal")
	healing = false;

