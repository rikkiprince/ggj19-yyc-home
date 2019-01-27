extends KinematicBody2D

export (int) var speed = 2

var velocity = Vector2()

func get_input():
	velocity = Vector2()
	
	

	velocity = (get_node("../Player/KinematicBody2D").global_position  - self.global_position).normalized()
	#print (get_node("../Player/KinematicBody2D").position)
	print(velocity)

func _physics_process(delta):
	get_input()
	move_and_collide(velocity *speed)