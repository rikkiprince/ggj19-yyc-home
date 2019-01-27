extends Area2D

func _on_Area2D_body_entered(body):
	if(body == get_tree().get_root().get_node("MainScene/Player/KinematicBody2D")):
		# set the center of this home for player to glide towards
		body.get_parent().center_of_home_vector = self.global_position
		
		# initiate healing
		print("Heal from Home")
		body.get_parent().healing = true
		
		# tell player to drop all carried objects
		var dropped = body.get_parent().drop_object()
		if(len(dropped) > 0):
			print(dropped)
			# grow
			# stamina up
			# play sound
			pass


func _on_Area2D_body_exited(body):
	if(body == get_node("../../Player/KinematicBody2D")):
		# ensure player isn't trying to glide back to center
		body.get_parent().center_of_home_vector = null
		
		# initiate healing
		print("STOP healing")
		body.get_parent().healing = false
