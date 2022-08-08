extends Area2D

func _on_Core_body_entered(player):
	if not player.unlocked_map:
		player.target = self
		player.get_node("Prompt").visible = true

func _on_Core_body_exited(player):
	player.get_node("Prompt").visible = false

func prompt(player):
	player.unlocked_map = true
	player.get_node("Prompt").visible = false
