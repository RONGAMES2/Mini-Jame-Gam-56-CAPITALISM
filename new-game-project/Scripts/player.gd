extends CharacterBody2D

@onready var sprite_2d: AnimatedSprite2D = $Sprite2D

const SPEED = 500.0
var accel = 50
var decel = 50

func _ready() -> void:
	GameManager.Player = self

func _exit_tree() -> void:
	GameManager.Player = null

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		velocity.x = move_toward(velocity.x, -SPEED, accel)
		sprite_2d.animation = "Run"
		sprite_2d.flip_h = true
	elif Input.is_action_pressed("right"):
		velocity.x = move_toward(velocity.x, SPEED, accel)
		sprite_2d.animation = "Run"
		sprite_2d.flip_h = false
	else:
		velocity.x = move_toward(velocity.x, 0, decel)
	if Input.is_action_pressed("up"):
		velocity.y = move_toward(velocity.y, -SPEED, accel)
		sprite_2d.animation = "Run"
	elif Input.is_action_pressed("down"):
		velocity.y = move_toward(velocity.y, SPEED, accel)
		sprite_2d.animation = "Run"
	else:
		velocity.y = move_toward(velocity.y, 0, decel)
	
	if velocity == Vector2(0, 0):
		sprite_2d.animation = "Idle"

	move_and_slide()
