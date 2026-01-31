extends CharacterBody2D

@export var speed = 32.0

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
