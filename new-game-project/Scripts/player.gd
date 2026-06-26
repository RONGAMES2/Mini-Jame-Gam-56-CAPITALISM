extends CharacterBody2D


const SPEED = 300.0

func _ready() -> void:
	GameManager.Player = self

func _exit_tree() -> void:
	GameManager.Player = null

func _physics_process(delta: float) -> void:
	if Input.is_action_pressed("left"):
		velocity = Vector2(-SPEED, 0)
	elif Input.is_action_pressed("right"):
		velocity = Vector2(SPEED, 0)
	elif Input.is_action_pressed("up"):
		velocity = Vector2(0, -SPEED)
	elif Input.is_action_pressed("down"):
		velocity = Vector2(0, SPEED)
	else:
		velocity = Vector2(0,0)
	
	move_and_slide()
