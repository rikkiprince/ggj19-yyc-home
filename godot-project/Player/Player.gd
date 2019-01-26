extends Node2D

const MOTION_SPEED = 8000
#var JOYPAD_SENSITIVITY = 5
const JOYPAD_DEADZONE = 0.50
var joypad_vec
var stamina


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
	return true