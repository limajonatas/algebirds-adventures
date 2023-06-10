extends Sprite2D

@onready var pai: Node2D = get_parent().get_parent()
@onready var sceneActive = false
@onready var nivel: Node2D = get_parent().get_parent().get_parent().get_parent().get_node("Nivel1")
@onready var menu: Node2D = get_parent().get_parent().get_parent().get_parent().get_node("OptionsPause")


func _input(event):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.is_pressed()
	):
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed() and get_tree().is_paused():
				print("Clicou no bot�o de Menu ", menu.sceneActive)
				menu.sceneActive = true
				nivel.sceneActive = false
