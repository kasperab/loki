extends Control

func _ready() -> void:
	global.reset()
	$Start.grab_focus()

func _on_start_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/tutorial.tscn")

func _on_quit_pressed() -> void:
	get_tree().quit()
