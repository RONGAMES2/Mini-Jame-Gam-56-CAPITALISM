extends Area2D

@onready var regen_timer: Timer = $Timer
@onready var item_amount_score: Label = $Label


var item_type = null
var item_amount = 0


func _on_timer_timeout() -> void:
	item_amount += 1
	item_amount_score.text = "Item Amount: " + str(item_amount)
	print("item amount: " + str(item_amount))
	regen_timer.start()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player"):
		regen_timer.paused = true
		item_amount_score.text = "Item Amount: 0"
		GameManager.Leather_amount += item_amount
		item_amount = 0
		


func _on_body_exited(body: Node2D) -> void:
	if body.is_in_group("Player"):
		regen_timer.paused = false
