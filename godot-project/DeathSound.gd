extends AudioStreamPlayer2D



func _on_KinematicBody2D_deathSignal():
	if (!self.playing): # make sure sound isnt already playing
		self.play(0)
