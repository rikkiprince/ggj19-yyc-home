extends KinematicBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var velocity = Vector2(0,0)
var attackMode = false

func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	add_to_group("star", true)
	


func _physics_process(delta):
	if (attackMode):	
		var collision_info = move_and_collide(velocity * 4)
		#if (collision_info != null and !collision_info.collider.is_in_group("star")):
		if (collision_info != null):
			self.queue_free() 

func _on_Area2D_body_entered(body):
	if(body.is_in_group("player")):
		velocity = (get_tree().get_root().get_node("MainScene/Player/KinematicBody2D").global_position  - self.global_position).normalized()
		print ("In")
		attackMode = true

