extends KinematicBody2D

export var speed = 30
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * speed
	velocity = move_and_slide(velocity)

func _process(delta):
	if Input.is_action_just_pressed("map"):
		var map = get_parent().get_node("Map/MapSprite")
		map.visible = !map.visible
