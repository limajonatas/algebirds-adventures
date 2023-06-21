extends Node2D
@onready var sceneActive = false
@onready var menuPrincipal = get_parent().get_node("MainMenu")
@onready var root: Node2D = get_parent()
@onready var jogo: Node2D = get_parent().get_node("Nivel1")
@onready var gameOverSound: AudioStreamPlayer2D = $GameOverSound
var playingSound = false


func _ready():
	gameOverSound.stop()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.visible = sceneActive
	if sceneActive:
		root.music.stop()
		if not playingSound:
			gameOverSound.play()
			playingSound = true


func _on_button_menu_menu_principal():
	sceneActive = false
	playingSound = false
	menuPrincipal.sceneActive = true
	root.music.play()
	root.buttonSound.play()
	_update_jogo()


func _on_button_restart_restart_fase():
	sceneActive = false
	playingSound = false
	root.buttonSound.play()
	root.faseAtual = 1
	_update_jogo()
	jogo.sceneActive = true


func _update_jogo():
	root.vidas = 3
	jogo._reset_fase()
	jogo.fadeInExecuted = false
	jogo._update_vidas()
