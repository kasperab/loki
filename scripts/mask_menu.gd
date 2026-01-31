extends VBoxContainer

@onready var player = $".."
@onready var sprite = $"../AnimatedSprite2D"

func _on_humanoid_pressed() -> void:
	player.form = "human"
	sprite.animation = "human_down"
	close()

func _on_horse_pressed() -> void:
	player.form = "horse"
	sprite.animation = "horse_down"
	close()

func _on_bird_pressed() -> void:
	player.form = "bird"
	sprite.animation = "bird_down"
	close()

func _on_jotun_pressed() -> void:
	player.form = "guard"
	sprite.animation = "guard_down"
	close()

func close() -> void:
	hide()
	get_tree().paused = false
