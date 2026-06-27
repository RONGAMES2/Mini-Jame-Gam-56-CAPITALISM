extends CanvasLayer

@onready var shoe_text: Label = $ShoeText/Label
@onready var Leather_amount_score: Label = $LeatherText/Label
@onready var Money_amount: Label = $MoneyText/Label
@onready var timer_text: Label = $TimerText/Label
@onready var delivery_text: Label = $DeliveryText/Label

func _ready() -> void:
	GameManager.delivery_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	Leather_amount_score.text = "Leather: " + str(GameManager.Leather_amount)
	shoe_text.text = "Shoes: " + str(GameManager.Shoe_amount)
	Money_amount.text = "Money: " + str(GameManager.Money)
	timer_text.text = "TIMER: %02d" % Timer()
	delivery_text.text = "Needed Deliveries: " + str(GameManager.needed_deliveries)
	

func Timer():
	var time_left = GameManager.delivery_timer.time_left
	var second = int(time_left) % 60
	return(second)
