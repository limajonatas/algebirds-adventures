extends Node2D
@onready var sceneActive = false
@onready var menuPrincipal = get_parent().get_node("MainMenu")
@onready var root: Node2D = get_parent()
@onready var jogo: Node2D = get_parent().get_node("Nivel1")
@onready var gameEndSound: AudioStreamPlayer2D = $GameEndSound
var playingSound = false


func _ready():
	gameEndSound.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.visible = sceneActive
	if sceneActive:
		root.music.stop()
		if not playingSound:
			gameEndSound.play()
			playingSound = true


func _on_button_menu_menu_principal():
	sceneActive = false
	playingSound = false
	menuPrincipal.sceneActive = true
	root.music.play()
	root.buttonSound.play()
	_update_jogo()

func _update_jogo():
	root.vidas = 3
	jogo._reset_fase()
	jogo.fadeInExecuted = false
	jogo._update_vidas()
