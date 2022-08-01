extends KinematicBody2D

export var speed = 30
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * speed
	velocity = move_and_slide(velocity)
