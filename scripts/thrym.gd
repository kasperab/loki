extends StaticBody2D

@export var interact_distance: float
var dialogue = [
	"Thrym: \"Loki, is that you? Have you heard? I stole Thor’s hammer! And I will only give it back if I get to marry Freya!\""
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("talk"):
			global.player.dialogue.start(dialogue)
			global.talked_to_thrym = true
