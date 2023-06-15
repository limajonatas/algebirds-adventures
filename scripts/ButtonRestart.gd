extends Sprite2D
signal restart_fase
@onready var pai: Node2D = get_parent()


func _input(event):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.is_pressed()
	):
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed() and pai.sceneActive:
				emit_signal("restart_fase")
