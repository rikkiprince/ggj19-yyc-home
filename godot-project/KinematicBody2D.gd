extends KinematicBody2D

export (int) var roamSpeed = 0.3
export (int) var chaseSpeed = 2.5
export (int) var speed = 2

var velocity = Vector2()
var attackMode = false
var paused = true

func get_input():
	velocity = Vector2()
	velocity = (get_node("../Player/KinematicBody2D").global_position  - self.global_position).normalized()
	#print (get_node("../Player/KinematicBody2D").position)
	#print(velocity)

func _physics_process(delta):
	if (!paused):
		if (attackMode):
			get_input()
			move_and_collide(velocity *speed)
		

func _on_SpikeyBoyArea_body_entered(body):
	if(body.is_in_group("player")):
		print ("In")
		attackMode = true
		speed = chaseSpeed


func _on_SpikeyBoyArea_body_exited(body):
	if(body.is_in_group("player")):
		attackMode = true
		print ("Out")
		speed = roamSpeed