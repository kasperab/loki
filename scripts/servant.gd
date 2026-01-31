extends StaticBody2D

@export var interact_distance: float
var mask_dialogue = [
	"You already have a jotun shape."
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("copy_mask"):
			if global.has_guard:
				global.player.dialogue.start(mask_dialogue)
			else:
				global.has_guard = true
				global.player.update_masks()
