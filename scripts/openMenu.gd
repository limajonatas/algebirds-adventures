extends Sprite2D
######################### CanvasLayer -> Pause (Node2D) -> Pause -> Root -> filhos
@onready var pai: Node2D = get_parent().get_parent()
@onready var sceneActive = false
@onready var nivel: Node2D = get_parent().get_parent().get_parent().get_parent().get_node("Nivel1_Fase1")
@onready var menu: Node2D = get_parent().get_parent().get_parent().get_parent().get_node("MainMenu")
@onready var root: Node2D = get_parent().get_parent().get_parent().get_parent()

func _process(_delta):
	if pai.optionsVisible:
		visible = false
	else:
		visible = true

func _input(event):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.is_pressed()
	):
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed() and get_tree().is_paused() and not pai.optionsVisible:
				root.buttonSound.play()
				menu.sceneActive = true
				nivel.sceneActive = false
