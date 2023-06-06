extends Control

func _ready():
	get_node("Button_back").pressed.connect(_on_Button_pressed)
func _on_Button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
