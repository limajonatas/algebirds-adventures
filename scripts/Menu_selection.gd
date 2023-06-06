extends Control

func _ready():
	get_node("Button_back").pressed.connect(_on_Button_pressed)
func _on_Button_pressed():
	print("veio")
	get_node("/root/Global").goto_scene("res://scenes/main_menu.tscn")
