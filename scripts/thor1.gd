extends StaticBody2D

@export var interact_distance: float
var dialogue = [
	"Thor: Loki! My hammer has been stolen! We have to find it! Perhaps Freya will know what to do?"
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("talk"):
			global.player.dialogue.start(dialogue)
