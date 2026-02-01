extends StaticBody2D

@export var interact_distance: float
var end_dialogue = [
	"Svadilfari: \"Well, hello there. How are you doing? <3 <3 <3\""
]
var horse_dialogue = [
	"You already have a horse shape."
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("copy_mask"):
			if global.has_horse:
				global.player.dialogue.start(horse_dialogue, true)
			else:
				global.has_horse = true
				global.player.update_masks()
		if global.player.form == "horse" and Input.is_action_just_pressed("talk"):
			global.player.dialogue.start(end_dialogue)
			global.player.dialogue.next_scene = "res://scenes/cutscene1.tscn"
			$AudioStreamPlayer.play()
