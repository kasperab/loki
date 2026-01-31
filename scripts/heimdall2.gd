extends StaticBody2D

@export var interact_distance: float
var dialogue1 = [
	"Heimdall: Thrym has the hammer, but he will only give it back if he gets to marry Freya? I don’t think she will agree to that."
]
var dialogue2 = [
	"Heimdall: Well, of course Freya wouldn’t want to marry Thrym. But I have an idea!",
	"Heimdall: What if you put Thor in a bridal dress and have him pretend to be Freya?",
	"Heimdall: Then he can stop the wedding as soon as he gets ahold of his hammer."
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("talk"):
			if global.heimdall_after_freya:
				global.thor_after_heimdall = true
				global.player.dialogue.start(dialogue2)
			else:
				global.player.dialogue.start(dialogue1)
