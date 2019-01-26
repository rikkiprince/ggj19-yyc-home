extends Node2D

const MOTION_SPEED = 8000
#var JOYPAD_SENSITIVITY = 5
const JOYPAD_DEADZONE = 0.50
var joypad_vec

func _ready():
	joypad_vec = Vector2(0,0)

func _physics_process(delta):
	pass