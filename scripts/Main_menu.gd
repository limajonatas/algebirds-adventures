extends Control

func _ready():
	get_node("Button_play").pressed.connect(_on_Button_pressed)
func _on_Button_pressed():
	print("veio")
	get_node("/root/Global").goto_scene("res://scenes/menu_selection.tscn")
