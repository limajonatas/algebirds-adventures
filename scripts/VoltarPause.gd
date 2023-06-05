extends Sprite2D
signal  voltar
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed():
				emit_signal("voltar")
			else:
				print('else')         
