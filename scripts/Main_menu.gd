extends Control

var button_play: Button
var button_options: Button


func _ready():
	get_node("Button_play").pressed.connect(_on_play)
	get_node("Button_options").pressed.connect(_on_option)


func _on_play():
	get_tree().change_scene_to_file("res://scenes/menu_selection.tscn")


func _on_option():
	get_tree().change_scene_to_file("res://scenes/options.tscn")
