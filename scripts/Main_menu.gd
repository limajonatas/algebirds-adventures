extends Control

var button_play: Button
var button_options: Button

func _ready():
	get_node("Button_play").pressed.connect(_on_Button_pressed)

func _on_Button_pressed():
	get_node("/root/Global").goto_scene("res://scenes/menu_selection.tscn")



