extends CharacterBody2D

@export var speed = 32.0
@onready var sprite = $AnimatedSprite2D
@onready var mask_menu = $MaskMenu
@onready var first_mask = $MaskMenu/GridContainer/Humanoid
var form = "human"

func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("mask_menu"):
		mask_menu.show()
		first_mask.grab_focus()
		get_tree().paused = true
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	velocity = velocity.normalized() * speed
	move_and_slide()
	if velocity.y < 0:
		sprite.animation = form + "_up"
	elif velocity.y > 0:
		sprite.animation = form + "_down"
	if velocity.x < 0:
		sprite.animation = form + "_left"
	elif velocity.x > 0:
		sprite.animation = form + "_right"
