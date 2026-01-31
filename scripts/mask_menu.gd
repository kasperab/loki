extends VBoxContainer

@onready var player = $".."
@onready var sprite = $"../AnimatedSprite2D"
@onready var loki_music = $"../LokiMusic"
@onready var horse_music = $"../HorseMusic"
@onready var pause = $"../Pause"

func _ready() -> void:
	$GridContainer/Horse.disabled = !global.has_horse
	$GridContainer/Bird.disabled = !global.has_bird
	$GridContainer/Jotun.disabled = !global.has_guard

func _on_humanoid_pressed() -> void:
	set_form("human", loki_music)
	close()

func _on_horse_pressed() -> void:
	set_form("horse", horse_music)
	close()

func _on_bird_pressed() -> void:
	set_form("bird", loki_music)
	close()

func _on_jotun_pressed() -> void:
	set_form("guard", loki_music)
	close()

func set_form(form: String, music: AudioStreamPlayer) -> void:
	player.form = form
	sprite.animation = form + "_down"
	loki_music.volume_db = -80
	horse_music.volume_db = -80
	music.volume_db = 0

func close() -> void:
	hide()
	get_tree().paused = false

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("pause"):
		hide()
		pause.show()
