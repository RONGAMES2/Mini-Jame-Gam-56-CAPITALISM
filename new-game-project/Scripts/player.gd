extends CharacterBody2D


const SPEED = 300.0
var accel = 50
var decel = 50

func _ready() -> void:
	GameManager.Player = self

func _exit_tree() -> void:
	GameManager.Player = null

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		velocity.x = move_toward(velocity.x, -SPEED, accel)
	elif Input.is_action_pressed("right"):
		velocity.x = move_toward(velocity.x, SPEED, accel)
	else:
		velocity.x = move_toward(velocity.x, 0, decel)
	if Input.is_action_pressed("up"):
		velocity.y = move_toward(velocity.y, -SPEED, accel)
	elif Input.is_action_pressed("down"):
		velocity.y = move_toward(velocity.y, SPEED, accel)
	else:
		velocity.y = move_toward(velocity.y, 0, decel)

	move_and_slide()
