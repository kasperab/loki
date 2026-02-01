extends Panel
class_name Dialogue

@onready var label = $Label
var dialogue: Array
var index: int
var next_scene: String = ""

func _process(_delta: float) -> void:
	if visible and Input.is_action_just_pressed("talk"):
		index += 1
		if index < dialogue.size():
			label.text = dialogue[index]
		else:
			hide()
			if !next_scene.is_empty():
				get_tree().change_scene_to_file(next_scene)

func start(new_dialogue: Array, is_mask = false) -> void:
	dialogue = new_dialogue
	if is_mask:
		index = 0
		label.text = dialogue[index]
	else:
		index = -1
	show()
