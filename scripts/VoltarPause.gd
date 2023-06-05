extends Sprite2D
signal  voltar
@onready var controlerPause: CanvasLayer = $CanvasLayer
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed():
				print('clicou')
				emit_signal("voltar")
			else:
				print('else')         
