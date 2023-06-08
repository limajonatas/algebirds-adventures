extends Control
@onready var levelsDesbloqueados = 1
@onready var level1: Button = get_node("Level1")
@onready var pai: Node2D = get_parent()
@onready var menu: Node2D = get_parent().get_parent().get_node("MainMenu")

func _ready():
	self.visible = false
	get_node("Button_back").pressed.connect(_on_Button_Back_pressed)
	if levelsDesbloqueados == 1:
		level1.bloqueado = false
		level1.pressed.connect(_on_Level1_pressed)

	get_node("Level2").bloqueado = true
	get_node("Level3").bloqueado = true
	get_node("Level4").bloqueado = true

func _process(_delta):
	if pai.sceneActive:
		self.visible = true
	else:
		self.visible = false


func _on_Button_Back_pressed():
	if pai.sceneActive:
		pai.sceneActive = false
		menu.sceneActive = true
		# get_tree().change_scene_to_file("res://scenes/main_menu.tscn")


func _on_Level1_pressed():
	if pai.sceneActive:
		get_tree().change_scene_to_file("res://scenes/nivel1.tscn")
