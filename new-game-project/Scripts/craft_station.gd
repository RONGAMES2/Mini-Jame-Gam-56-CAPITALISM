extends Area2D

@onready var label: Label = $Label

var can_craft = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Craft") and GameManager.Leather_amount >= 3 and can_craft:
			GameManager.Leather_amount -= 3
			GameManager.Shoe_amount += 1


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		label.visible = true
		can_craft = true
		print("test")

func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		can_craft = false
		label.visible = false
