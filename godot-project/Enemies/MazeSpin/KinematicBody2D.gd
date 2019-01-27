extends KinematicBody2D

var rotation_speed = 0.04

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass


func _process(delta):
	self.rotation = (self.rotation  +  delta * rotation_speed)