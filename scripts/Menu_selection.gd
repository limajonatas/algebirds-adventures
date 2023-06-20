extends Control
@onready var root: Node2D = get_parent().get_parent()
@onready var pai: Node2D = get_parent()
@onready var menu: Node2D = get_parent().get_parent().get_node("MainMenu")


func _ready():
	self.visible = false
	get_node("Button_back").pressed.connect(_on_Button_Back_pressed)


func _process(_delta):
	if pai.sceneActive:
		self.visible = true
	else:
		self.visible = false

#botao de voltar
func _on_Button_Back_pressed():
	##se o menu de levels está ativo
	if pai.sceneActive:
		root.buttonBackSound.play()
		pai.sceneActive = false
		menu.sceneActive = true

