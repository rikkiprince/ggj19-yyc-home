extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
enum PICKUP {
	diamond
}


func _on_Area2D_body_entered(body):
	print("POWERUP")
	print(body)
	if(body == get_node("../../Player/KinematicBody2D")):
		# tell body to attempt to pick up (type of) object
		print(body.get_parent().name)
		var picked_up = body.get_parent().pick_up_object(self, PICKUP.diamond)
		if(picked_up):
			# (turn off collider and initiate animation/particle effect: nice to have)
			# remove this object
			print(get_parent().name)
			get_parent().queue_free()
