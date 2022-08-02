extends Sprite

var timer = 0

func _process(delta):
	timer += delta
	if timer >= 0.5:
		timer = 0
		self.visible = !self.visible
	
