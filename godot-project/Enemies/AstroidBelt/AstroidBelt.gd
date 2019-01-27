extends Node2D

# class member variables go here, for example:

var rotation_speed = 0.5

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	self.rotation = (self.rotation  + delta * rotation_speed)
