extends KinematicBody2D

var unlocked_map = false
export var speed = 30
var velocity = Vector2.ZERO
var notes = {

}

func _physics_process(delta):
	velocity = Input.get_vector("move_left", "move_right", "move_up", "move_down") * speed
	velocity = move_and_slide(velocity)
	if velocity.x > 0:
		$Sprite.flip_h = true
	elif velocity.x < 0:
		$Sprite.flip_h = false

func _process(delta):
	if unlocked_map and Input.is_action_just_pressed("map"):
		var map = get_parent().get_node("Map")
		map.toggle()
	
	for note in notes.keys():
		notes[note] = notes[note] - delta
		if notes[note] <= 0:
			notes[note] = 0
			get_node(note).stop()
		if Input.is_action_just_pressed(note):
			get_node(note).play()
			notes[note] = 1
		AB()

# SEQUENCES
func AB():
	var door = get_node("/root/Main/TileMap/Door")
	var player = get_node("/root/Main/Player")
	var position = player.position
	var distance = self.position.distance_to(door.position)
	var complete = false
	
	if notes["tone_a"] > 0 and notes["tone_b"] > notes["tone_a"] and distance < 20.0:
		door.open()
		print("ayyy")
	else:
		door.close()
