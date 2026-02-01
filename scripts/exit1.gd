extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	if global.player.form == "bird":
		get_tree().change_scene_to_file("res://scenes/road1.tscn")
	else:
		global.player.global_position.x -= 16
		global.player.dialogue.start(["Loki: \"I can't go there on foot.\""], true)
