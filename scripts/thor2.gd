extends StaticBody2D

@export var interact_distance: float
var dialogue1 = [
	"Thor: \"What? Thrym stole my hammer?! And he will only give it back if he gets to marry Freya?\"",
	"Thor: \"Well, I guess we should convinve Freya to marry him then.\""
]
var dialogue2 = [
	"Thor: \"Put me in a bridal dress?! People would never stop laughing at me!\"",
	"Thor: \"I guess you’re right. It is the only way to get my hammer back.\""
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("talk"):
			if global.thor_after_heimdall:
				global.player.dialogue.start(dialogue2)
				global.player.dialogue.next_scene = "res://scenes/cutscene2.tscn"
			else:
				global.player.dialogue.start(dialogue1)
