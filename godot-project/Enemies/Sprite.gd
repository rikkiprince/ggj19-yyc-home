extends Sprite

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var rotation_speed = 0.5

func _ready():
	pass

func _process(delta):
	self.rotation = (self.rotation  + delta * rotation_speed)
	
