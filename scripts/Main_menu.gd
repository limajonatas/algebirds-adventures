extends Control
@onready var pai = get_parent()
@onready var root = get_parent().get_parent()
#@onready var canvaLayerConfirmarSair = get_node("ConfirmarSair")
@onready var options = get_parent().get_parent().get_node("Options")
@onready var credits = get_parent().get_parent().get_node("Credits")
@onready var levels = get_parent().get_parent().get_node("Levels")
@onready var buttonOpenCredits:Button = get_node("Button_credits")
func _ready():
	get_node("Button_play").pressed.connect(_on_play)
	get_node("Button_options").pressed.connect(_on_option)
	get_node("Button_quit").pressed.connect(_on_quit)
	buttonOpenCredits.pressed.connect(_on_open_credits)


func _on_play():
	if pai.sceneActive:
		root.buttonSound.play()
		pai.sceneActive = false ## desativa o menu principal
		levels.sceneActive = true
		# get_tree().change_scene_to_file("res://scenes/menu_selection.tscn")


func _process(_delta):
	if pai.sceneActive:
		self.visible = true
	else:
		self.visible = false


func _on_option():
	if pai.sceneActive:
		root.buttonSound.play()
		options.sceneActive = true
		pai.sceneActive = false ## desativa o menu principal
		# get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_open_credits():
	if pai.sceneActive:
		root.buttonSound.play()
		pai.sceneActive = false ## desativa o menu principal
		credits.sceneActive = true
		
func _on_quit():
	if pai.sceneActive:
		#canvaLayerConfirmarSair.canva.visible = true
		get_tree().quit()
