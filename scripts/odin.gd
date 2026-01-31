extends StaticBody2D

@export var interact_distance: float
var start_dialogue = [
	"Odin: There you are, Loki! The builder you hired is almost done!",
	"Odin: And as you recall, you were the one who offered him Freya's hand in marriage if he would finish within one winter.",
	"Odin: That horse of his is supernaturally fast. You caused this mess. Now fix this!",
	"Odin: Perhaps you can do something if you copy some shapes? Press C next to someone to copy their shape."
]
var horse_dialogue = [
	"Odin: That should work great! Now go distract that horse!"
]
var human_dialogue = [
	"You already have a humanoid shape."
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("talk"):
			if global.has_horse:
				global.player.dialogue.start(horse_dialogue)
			else:
				global.player.dialogue.start(start_dialogue)
		elif Input.is_action_just_pressed("copy_mask"):
			global.player.dialogue.start(human_dialogue, true)
