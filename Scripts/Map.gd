extends CanvasLayer

var control
func _ready():
	control = get_node("Control")

func _process(delta):
	var position = get_node("/root/Main/Player").position
	control.get_node("PlayerSprite").position = position / 32
	
func toggle():
	control.visible = !control.visible
