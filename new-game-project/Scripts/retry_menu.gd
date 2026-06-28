extends CanvasLayer

@onready var label: Label = $DeliveredShoes/Label


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if GameManager.player_lost:
		visible = true
	else:
		visible = false
	label.text = "Total Deliveries: " + str(GameManager.total_deliveries)


func _on_retry_button_pressed() -> void:
	GameManager.player_lost = false
	get_tree().paused = !get_tree().paused
	get_tree().reload_current_scene()


func _on_main_menu_button_pressed() -> void:
	GameManager.player_lost = false
	get_tree().paused = !get_tree().paused
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
