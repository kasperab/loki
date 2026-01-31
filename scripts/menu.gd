extends Control

func _ready() -> void:
	global.reset()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")
