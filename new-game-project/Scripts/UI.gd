extends CanvasLayer

@onready var shoe_text: Label = $ShoeText/Label
@onready var Leather_amount_score: Label = $LeatherText/Label
@onready var Money_amount: Label = $MoneyText/Label

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Leather_amount_score.text = "Leather: " + str(GameManager.Leather_amount)
	shoe_text.text = "Shoes: " + str(GameManager.Shoe_amount)
	Money_amount.text = "Money: " + str(GameManager.Money)
