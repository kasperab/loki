extends StaticBody2D

@export var interact_distance: float
var dialogue = [
	"Heimdall: Hm, I think I saw some jotuns heading towards Thrym’s domain.",
	"Heimdall: But you should be careful. There are many dangers between here and there."
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("talk"):
			global.player.dialogue.start(dialogue)
