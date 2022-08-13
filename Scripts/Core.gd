extends Sprite

var runes = {
	"A": 0,
	"B": 0,
	"C": 0,
	"D": 0
}

func _ready():
	 get_parent().get_node("Player").connect("note_played", self, "_on_note_played") 

func _process(delta):
	for rune in runes.keys():
		runes[rune] = max(0, runes[rune] - delta)
		if runes[rune] <= 0:
			get_node(rune).frame = 0

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

func _on_note_played(player: Node2D, sequence: String):
	if (player.position - self.position).length() < 40:
		for rune in runes.keys():
			if rune in sequence:
				runes[rune] = 0.5
				get_node(rune).play()
