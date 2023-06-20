extends Node2D

@onready var options: Node2D = $Options

var faseAtual: int = 1
var nivelAtual: int = 1
var fasesDesbloqueadas: int = 1
var vidas: int = 3

# @onready var nivel1_fase1: Node2D = $Nivel1

@onready var musicOn: bool = true
@onready var music: AudioStreamPlayer2D = $Music
@onready var music2: AudioStreamPlayer2D = $Music2
@onready var buttonSound: AudioStreamPlayer2D = $ButtonSound
@onready var buttonBackSound: AudioStreamPlayer2D = $ButtonBackSound

@onready var soundOff: Sprite2D = $SoundOff
##### FASE 1 #####
# var pergunta1: String = "2+2"
# var resposta1: String = "4"
# var opcoes1: Array = ["4", "22", "2", "8"]

# var pergunta2: String = "2+3"
# var resposta2: String = "5"
# var opcoes2: Array = ["6", "1", "23", "5"]

# var pergunta3: String = "2+4"
# var resposta3: String = "6"
# var opcoes3: Array = ["4", "6", "7", "24"]

# var pergunta4: String = "2+5"
# var resposta4: String = "7"
# var opcoes4: Array = ["27", "6", "7", "5"]

var pergunta_nivel1_fase1:String = "2+4"
var resposta_nivel1_fase1:String = "6"
var opcoes_nivel1_fase1:Array = ["4", "6", "2", "8"]

var pergunta_nivel1_fase2:String = "5+2"
var resposta_nivel1_fase2:String = "7"
var opcoes_nivel1_fase2:Array = ["8", "5", "10", "7"]

var pergunta_nivel1_fase3:String = "9+3"
var resposta_nivel1_fase3:String = "12"
var opcoes_nivel1_fase3:Array = ["11", "12", "6", "93"]

var pergunta_nivel1_fase4:String = "7+8"
var resposta_nivel1_fase4:String = "15"
var opcoes_nivel1_fase4:Array = ["78", "16", "14", "15"]

##### FASE 2 #####


func _ready():
	get_tree().paused = false
	music2.stop()
	buttonSound.stop()
	buttonBackSound.stop()


func _process(_delta):
	if musicOn:
		soundOff.visible = false
	else:
		soundOff.visible = true

