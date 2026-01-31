extends StaticBody2D

@export var interact_distance: float
var dialogue = [
	"Freya: He wants what??!! Absolutely not! I will not marry some jotun just so Thor can get his hammer back!",
	"Freya: You will have to find some other solution."
]

func _process(_delta: float) -> void:
	if global.player.dialogue.visible:
		return
	if global.player.global_position.distance_to(global_position) < interact_distance:
		if Input.is_action_just_pressed("talk"):
			global.heimdall_after_freya = true
			global.player.dialogue.start(dialogue)
