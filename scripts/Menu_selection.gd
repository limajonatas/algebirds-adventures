extends Control
@onready var levelsDesbloqueados = 1
@onready var level1: Button = get_node("Level1")


func _ready():
	get_node("Button_back").pressed.connect(_on_Button_pressed)
	if levelsDesbloqueados == 1:
		level1.bloqueado = false
		level1.pressed.connect(_on_Level1_pressed)

	get_node("Level2").bloqueado = true
	get_node("Level3").bloqueado = true
	get_node("Level4").bloqueado = true


func _on_Button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_Level1_pressed():
	get_tree().change_scene_to_file("res://scenes/nivel1.tscn")
