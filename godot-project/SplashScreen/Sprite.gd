extends Sprite

func _ready():
	pass
	
func nextFrame():
	if self.frame < 1:
		self.frame = self.frame + 1
	else:
		self.frame = 0