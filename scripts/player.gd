extends CharacterBody2D

@export var speed = 32.0
@onready var sprite = $AnimatedSprite2D

func _process(_delta: float) -> void:
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
		sprite.animation = "up"
	elif velocity.y > 0:
		sprite.animation = "down"
	if velocity.x < 0:
		sprite.animation = "left"
	elif velocity.x > 0:
		sprite.animation = "right"
