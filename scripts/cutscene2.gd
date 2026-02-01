extends Control

@onready var label = $Dialogue/Label
@onready var story = [
	[$Eat, "And so, Thor and Loki travelled to Thrym's castle, dressed up as Freya and a bridesmaid."],
	[$Eat, 'Thrym: "Wow. Freya sure eats and drinks a lot. I\'ve never seen a woman eat or drink that much."'],
	[$Eat, 'Loki: "Oh, Freya was so excited for this wedding that she couldn\'t eat anything for eight days."'],
	[$Eat, 'Thrym: "Why are her eyes so wild? They burn like fire!"'],
	[$Eat, 'Loki: "Oh, Freya was so excited for this wedding that she couldn\'t sleep for eight nights."'],
	[$Eat, 'Thrym: "Well then! Carry in the bridal gift! The hammer!"'],
	[$Eat, 'Thor: "Thank you, Thrym."'],
	[$Fight, 'With his hammer back, Thor made short work of the jotuns. And afterwards, Thor and Loki returned to Asgard triumphant.'],
	[$Empty, 'Mission Accomplished!']
]
var index = -1

func _ready() -> void:
	next()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("talk"):
		next()

func next() -> void:
	$Eat.hide()
	$Fight.hide()
	$Empty.hide()
	index += 1
	if index < story.size():
		story[index][0].show()
		label.text = story[index][1]
	else:
		get_tree().change_scene_to_file("res://scenes/menu.tscn")
