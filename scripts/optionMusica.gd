extends Sprite2D

@onready var pai = get_parent().get_parent()
@onready var root = get_parent().get_parent().get_parent()

func _process(_delta):
	if root.musicOn:
		self.texture = load("res://assets/menu/desativarMusica.png")
	else:
		self.texture = load("res://assets/menu/ativarMusica.png")
	

func _input(event):
	if (
		event is InputEventMouseButton
		and event.button_index == MOUSE_BUTTON_LEFT
		and event.is_pressed()
	):
		if get_rect().has_point(get_local_mouse_position()):
			if event.is_pressed() and pai.sceneActive:
				if root.musicOn:
					root.musicOn = false
					root.music.stop()
				else:
					root.musicOn = true
					root.music.play()
