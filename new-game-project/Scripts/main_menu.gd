extends CanvasLayer

@onready var instructions_tab: Control = $"Instructions Tab"
@onready var title: BoxContainer = $Title
@onready var play: BoxContainer = $Play
@onready var quit: BoxContainer = $Quit
@onready var carrooootttt: Sprite2D = $Carrooootttt


func _on_play_button_pressed() -> void:
	title.visible = false
	play.visible = false
	quit.visible = false
	carrooootttt.visible = false
	instructions_tab.visible = true


func _on_quit_button_pressed() -> void:
	get_tree().quit()


func _on_start_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/test_scene.tscn")
