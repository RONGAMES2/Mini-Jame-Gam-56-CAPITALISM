extends Area2D

@onready var instructions: Label = $Instructions

var can_deliver = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if can_deliver and Input.is_action_just_pressed("Deposit"):
		if GameManager.needed_deliveries <= GameManager.Shoe_amount:
			for x in range(GameManager.needed_deliveries):
				GameManager.Money += 100
				GameManager.Shoe_amount -= 1
				GameManager.needed_deliveries -= 1
				GameManager.total_deliveries += 1
		elif GameManager.needed_deliveries > GameManager.Shoe_amount:
			for x in range(GameManager.Shoe_amount):
				GameManager.Money += 100
				GameManager.Shoe_amount -= 1
				GameManager.needed_deliveries -= 1
				GameManager.total_deliveries += 1
	
	if GameManager.needed_deliveries <= 0:
		GameManager.Reset_Timer()
		GameManager.Reset_Deliveries()
		GameManager.finished_deliveries += 1
	


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		instructions.visible = true
		can_deliver = true


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		instructions.visible = false
		can_deliver = false
