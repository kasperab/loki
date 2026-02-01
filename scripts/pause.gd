extends Control

#func _process(_delta: float) -> void:
	#if Input.is_action_just_pressed("pause"):
		#hide()
		#get_tree().paused = false

func _on_resume_pressed() -> void:
	hide()
	get_tree().paused = false

func focus() -> void:
	$Resume.grab_focus()

func _on_quit_pressed() -> void:
	get_tree().paused = false
	get_tree().change_scene_to_file("res://scenes/menu.tscn")
