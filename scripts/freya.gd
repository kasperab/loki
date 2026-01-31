extends StaticBody2D

@export var interact_distance: float
var dialogue = [
	"Freya: I can't believe I let you talk me into this. You have to fix this somehow!"
]
var human_dialogue = [
	"You already have a humanoid shape."
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("talk"):
			global.player.dialogue.start(dialogue)
		elif Input.is_action_just_pressed("copy_mask"):
			global.player.dialogue.start(human_dialogue, true)
