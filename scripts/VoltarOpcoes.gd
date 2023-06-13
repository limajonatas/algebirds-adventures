extends Sprite2D
@onready var pai:Node2D = get_parent().get_parent()
@onready var menu:Node2D = get_parent().get_parent().get_parent().get_node("MainMenu")

func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed() and pai.sceneActive:
				pai.sceneActive = false
				menu.sceneActive = true
				# get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
