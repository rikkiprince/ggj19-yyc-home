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
