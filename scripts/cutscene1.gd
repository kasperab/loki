extends Control

var countdown = 2.0

func _process(delta: float) -> void:
	countdown -= delta
	if countdown <= 0:
		get_tree().change_scene_to_file("res://scenes/asgard1.tscn")
