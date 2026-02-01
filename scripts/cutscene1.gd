extends Control

@onready var label = $Dialogue/Label
@onready var story = [
	[$Chase, 'Builder: "Hey, get back here!"'],
	[$Chase, 'Odin: "Well well, I guess you won\'t finish in time after all."'],
	[$Fight, 'Builder: "Ghraaarrggh!!!"'],
	[$Fight, 'Odin: "It\'s a jotun!"'],
	[$Fight, 'Thor: "Don\'t worry, father. I\'ll handle it!"'],
	[$Fight, 'Thor: "Take that!"'],
	[$Empty, 'Several months later.'],
	[$Return, 'Odin: "Oh, where did this foal come from?"'],
	[$Return, 'Loki: "I don\'t want to talk about it."'],
	[$Empty, 'Mission Accomplished!']
]
var index = -1

func _ready() -> void:
	next()

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("talk"):
		next()

func next() -> void:
	$Chase.hide()
	$Fight.hide()
	$Return.hide()
	$Empty.hide()
	index += 1
	if index < story.size():
		story[index][0].show()
		label.text = story[index][1]
	else:
		get_tree().change_scene_to_file("res://scenes/asgard1.tscn")
