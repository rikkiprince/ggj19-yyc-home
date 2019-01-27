extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass

#func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass


func _on_Area2D_body_entered(body):
	print(body)
	if(body == get_node("../../Player/KinematicBody2D")):
	# tell body to attempt to pick up (type of) object
		var dropped = body.get_parent().drop_object()
		if(len(dropped) > 0):
			print(dropped)
			# grow
			# stamina up
			# play sound
			pass
