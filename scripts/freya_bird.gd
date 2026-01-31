extends StaticBody2D

@export var interact_distance: float
var dialogue = [
	"Freya: Hi, Loki! Look! I’m a bird now!",
	"Freya: What? Thor’s hammer has been stolen? Oh no!",
	"Freya: How about you copy my bird-shape. Then you can fly to Jotunheim and see if you can find any clues?"
]
var mask_dialogue = [
	"You already have a bird shape."
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("talk"):
			global.player.dialogue.start(dialogue)
		if Input.is_action_just_pressed("copy_mask"):
			if global.has_bird:
				global.player.dialogue.start(mask_dialogue)
			else:
				global.has_bird = true
				global.player.update_masks()
