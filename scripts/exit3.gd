extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	if global.talked_to_thrym:
		get_tree().change_scene_to_file("res://scenes/road2.tscn")
	else:
		global.player.global_position.y -= 16
		global.player.dialogue.start(["Loki: \"I have to find where the hammer is.\""], true)
