extends StaticBody2D

@export var player: Player
@export var interact_distance: float
@onready var mask_sprite = $Sprite2D

func _process(_delta: float) -> void:
	if player.global_position.distance_to(global_position) < interact_distance:
		mask_sprite.show()
		if !global.has_horse and Input.is_action_just_pressed("copy_mask"):
			global.has_horse = true
			player.update_masks()
		if player.form == "horse":
			pass
	else:
		mask_sprite.hide()
