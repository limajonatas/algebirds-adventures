extends Sprite2D
######################### CANVAS layer -> Pause -> Nivel 1 -> Root
@onready var paiPause: Node2D = get_parent().get_parent()
@onready var root: Node2D = get_parent().get_parent().get_parent().get_parent()
	

func _process(_delta):
	if paiPause.optionsVisible:
		self.visible = true
		if root.musicOn:
			self.texture = load("res://assets/menu/desativarMusica.png")
		else:
			self.texture = load("res://assets/menu/ativarMusica.png")
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
				if root.musicOn:
					root.musicOn = false
					root.music.stop()
				else:
					root.musicOn = true
					root.music.play()
