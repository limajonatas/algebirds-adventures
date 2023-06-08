extends Sprite2D
signal naoSair

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _input(event):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.is_pressed()
	):
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed() && get_tree().paused:
				emit_signal("naoSair")
