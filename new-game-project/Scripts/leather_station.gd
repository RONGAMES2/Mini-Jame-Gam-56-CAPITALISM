extends Area2D

@onready var cooldown: Timer = $Cooldown

var can_make = false
var no_cool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_make:
		if Input.is_action_just_pressed("Craft") and no_cool:
			no_cool = false
			cooldown.start()
			GameManager.Leather_amount += 1


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		can_make = true
		


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		can_make = false
		


func _on_cooldown_timeout() -> void:
	no_cool = true
