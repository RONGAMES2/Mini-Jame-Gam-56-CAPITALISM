extends Node

var Player = null

# subject to change
@onready var Leather_amount = 0
@onready var Shoe_amount = 0
@onready var Money = 0
@onready var delivery_timer: Timer = $DeliveryTimer

var needed_deliveries = 0
var min_deliveries = 2
var max_deliveries = 5

var finished_deliveries = 0
var delivery_buff = 5

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	needed_deliveries = 3
	finished_deliveries = 0
	delivery_buff = 5
	Leather_amount = 0
	Shoe_amount = 0
	Money = 0

func Reset_Deliveries():
	needed_deliveries = randi_range(min_deliveries, max_deliveries)

func Reset_Timer():
	delivery_timer.wait_time = randi_range(30, 50)
	delivery_timer.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_delivery_timer_timeout() -> void:
	get_tree().quit()
