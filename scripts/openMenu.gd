extends Sprite2D


func _input(event):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.is_pressed()
	):
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed() && get_tree().is_paused():
				get_tree().set_pause(false)
				get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
