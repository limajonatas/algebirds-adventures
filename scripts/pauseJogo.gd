extends Sprite2D

signal  pausar
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed():
				#get_tree().paused = true;
				emit_signal("pausar")
			else:
				print('else')