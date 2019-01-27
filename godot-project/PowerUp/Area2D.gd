extends Area2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
enum PICKUP {
	diamond
}


func _on_Area2D_body_entered(body):
	print(body)
	# tell body to attempt to pick up (type of) object
	var picked_up = body.get_parent().pick_up_object(self, PICKUP.diamond)
	if(picked_up):
		# (turn off collider and initiate animation/particle effect: nice to have)
		# remove this object
		get_parent().remove_child(self)
