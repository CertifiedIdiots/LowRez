extends Sprite

var rune_a = load("res://Art/Animations/runes/rune_A2_small.png")
var rune_b = load("res://Art/Animations/runes/rune_B2_small.png") 
var rune_c = load("res://Art/Animations/runes/rune_C2_small.png") 
var rune_d = load("res://Art/Animations/runes/rune_D2_small.png") 

func _ready():
	 get_parent().get_node("Player").connect("sequence_played", self, "_on_sequence_played") 

func _on_Core_body_entered(player):
	if not player.unlocked_map:
		player.target = self
		player.get_node("Prompt").visible = true

func _on_Core_body_exited(player):
	player.get_node("Prompt").visible = false

func prompt(player):
	player.unlocked_map = true
	player.get_node("Prompt").visible = false
	get_parent().get_node("Map").toggle()

func _on_sequence_played(player: Node2D, sequence: String):
	if (player.position - self.position).length() < 40:
		if "a" in sequence:
			$A.play()
		if "b" in sequence:
			$B.play()
		if "c" in sequence:
			$C.play()
		if "d" in sequence:
			$D.play()
		
	
