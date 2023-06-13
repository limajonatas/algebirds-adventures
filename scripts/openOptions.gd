extends Sprite2D

@onready var pai: Node2D = get_parent().get_parent()
@onready var openOptions: Node2D = get_parent().get_node("OptionsPause")

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
				pai.optionsVisible = true
