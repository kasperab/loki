extends Node

var has_horse = false
var has_bird = false
var has_guard = false
var player: Player
var thor_after_heimdall = false
var heimdall_after_freya = false

func reset() -> void:
	has_horse = false
	has_bird = false
	has_guard = false
	thor_after_heimdall = false
	heimdall_after_freya = false
