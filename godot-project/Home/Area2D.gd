extends Area2D

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
