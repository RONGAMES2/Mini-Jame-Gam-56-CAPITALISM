extends Node

var Player = null

# subject to change
@onready var Leather_amount = 0
@onready var Shoe_amount = 0
@onready var Money = 0
@onready var delivery_timer: Timer = $DeliveryTimer

var needed_deliveries = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	needed_deliveries = randi_range(5, 10)

func Reset_Deliveries():
	needed_deliveries = randi_range(5, 10)

func Reset_Timer():
	delivery_timer.wait_time = randi_range(20, 50)
	delivery_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_delivery_timer_timeout() -> void:
	get_tree().quit()
