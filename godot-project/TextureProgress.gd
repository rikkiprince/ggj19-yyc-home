extends TextureProgress



func _ready():
	# Called when the node is added to the scene for the first time.
	# Initialization here
	pass



func _on_KinematicBody2D_staminaSignal(stamina):
	self.value = stamina

func _on_KinematicBody2D_hitSignal(stamina):
	self.value = stamina

func _on_KinematicBody2D_deathSignal():
	self.value = 0
	get_tree().quit()


func _on_Player_change_max_stamina_bar(new_max_stamina):
	# set new max_value in progress bar
	self.max_value = new_max_stamina
	# expand scale of progress bar so it looks bigger
	get_parent().global_scale.x = new_max_stamina/100.0
