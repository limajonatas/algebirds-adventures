extends Sprite2D

@onready var paiPause: Node2D = get_parent().get_parent()

func _process(_delta):
	if paiPause.optionsVisible:
		self.visible = true
	else:
		self.visible = false

func _input(event):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.is_pressed()
	):
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed() and paiPause.optionsVisible:
				paiPause.optionsVisible = false
