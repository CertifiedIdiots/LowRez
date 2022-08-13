extends AnimatedSprite

func _ready():
	get_parent().get_node("Player").connect("sequence_played", self, "_on_sequence_played") 
	
func _on_sequence_played(player, sequence):
	print($Timer.is_stopped())
	if "CD" in sequence:
		$Timer.start(5)
		play()
		$AudioStreamPlayer2D.play()

func _on_Timer_timeout():
	play("", true)
