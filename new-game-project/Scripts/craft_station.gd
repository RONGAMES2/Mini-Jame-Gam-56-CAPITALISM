extends Area2D

@onready var label: Label = $Instructions
@onready var warning_label: Label = $WarningLabel

@onready var fade_timer: Timer = $FadeTimer

var can_craft = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_craft and Input.is_action_just_pressed("Craft"):
		if GameManager.Leather_amount >= 3:
			GameManager.Leather_amount -= 3
			GameManager.Shoe_amount += 1
		else:
			fade_timer.start()
			warning_label.visible = true


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		label.visible = true
		can_craft = true
		print("test")

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		can_craft = false
		label.visible = false


func _on_fade_timer_timeout() -> void:
	warning_label.visible = false
