extends Sprite2D
signal sair_do_jogo


func _input(event):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.is_pressed()
	):
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed() and get_tree().is_paused():
				get_tree().quit()
				emit_signal("sair_do_jogo")
