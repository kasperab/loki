extends CharacterBody2D
class_name Player

@export var speed = 32.0
@onready var sprite = $AnimatedSprite2D
@onready var mask_menu = $MaskMenu
@onready var first_mask = $MaskMenu/GridContainer/Humanoid
var form = "human"
@onready var pause = $Pause
@export var step_time = 1.0
var step_countdown = 0.0
@onready var footstep = $Footstep
@onready var dialogue: Dialogue = $Dialogue

func _ready() -> void:
	global.player = self

func _process(delta: float) -> void:
	velocity.x = 0
	velocity.y = 0
	if Input.is_action_just_pressed("pause"):
		pause.show()
		get_tree().paused = true
	if dialogue.visible:
		return
	if Input.is_action_just_pressed("mask_menu"):
		mask_menu.show()
		first_mask.grab_focus()
		get_tree().paused = true
	if Input.is_action_pressed("up"):
		velocity.y -= 1
	if Input.is_action_pressed("down"):
		velocity.y += 1
	if Input.is_action_pressed("left"):
		velocity.x -= 1
	if Input.is_action_pressed("right"):
		velocity.x += 1
	velocity = velocity.normalized() * speed
	if velocity.length() > 0:
		step_countdown -= delta
		if step_countdown <= 0:
			step_countdown = step_time
			footstep.play()
	move_and_slide()
	if velocity.y < 0:
		sprite.animation = form + "_up"
	elif velocity.y > 0:
		sprite.animation = form + "_down"
	if velocity.x < 0:
		sprite.animation = form + "_left"
	elif velocity.x > 0:
		sprite.animation = form + "_right"

func update_masks() -> void:
	mask_menu._ready()
