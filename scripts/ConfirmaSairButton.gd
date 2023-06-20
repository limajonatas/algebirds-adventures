extends Sprite2D ##BOTAO DE CONFIRMAR A SAÍDA DO JOGO
@onready var nodepai:Node2D = get_parent().get_parent()

func _input(event):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.is_pressed()
	):
	##CONFIRMAR SAÍDA DO JOGO
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed() and get_tree().paused:
				get_tree().quit()
