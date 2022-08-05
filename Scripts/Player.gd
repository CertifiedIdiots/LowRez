extends KinematicBody2D

export var speed = 30
var velocity = Vector2.ZERO

func _physics_process(delta):
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * speed
	velocity = move_and_slide(velocity)
	print(self.position)

func _process(delta):
	if Input.is_action_just_pressed("map"):
		var map = get_parent().get_node("Map")
		map.toggle()
	
	if Input.is_action_just_pressed("tone_a"):
		$ToneA.play()
	elif Input.is_action_just_released("tone_a"):
		$ToneA.stop()
	
	if Input.is_action_just_pressed("tone_b"):
		$ToneB.play()
	elif Input.is_action_just_released("tone_b"):
		$ToneB.stop()
		
	if Input.is_action_just_pressed("tone_c"):
		$ToneC.play()
	elif Input.is_action_just_released("tone_c"):
		$ToneC.stop()
	
	if Input.is_action_just_pressed("tone_d"):
		$ToneD.play()
	elif Input.is_action_just_released("tone_d"):
		$ToneD.stop()
	
