extends Node2D
@onready var fileData = "res://data/data.lvs.aa"
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
##### FASE 1 ##### OPERA��ES SIMPLES DE ADI��O #####

var pergunta_nivel1_fase1: String = "2+4"
var resposta_nivel1_fase1: String = "6"
var opcoes_nivel1_fase1: Array = ["4", "6", "2", "8"]

var pergunta_nivel1_fase2: String = "5+2"
var resposta_nivel1_fase2: String = "7"
var opcoes_nivel1_fase2: Array = ["8", "5", "10", "7"]

var pergunta_nivel1_fase3: String = "9+3"
var resposta_nivel1_fase3: String = "12"
var opcoes_nivel1_fase3: Array = ["11", "12", "6", "93"]

var pergunta_nivel1_fase4: String = "7+8"
var resposta_nivel1_fase4: String = "15"
var opcoes_nivel1_fase4: Array = ["78", "16", "14", "15"]

##### FASE 2 ##### OPERA��ES SIMPLES DE SUBTRA��O #####
var pergunta_nivel2_fase1: String = "8-2"
var resposta_nivel2_fase1: String = "6"
var opcoes_nivel2_fase1: Array = ["4", "6", "2", "8"]

var pergunta_nivel2_fase2: String = "9-3"
var resposta_nivel2_fase2: String = "6"
var opcoes_nivel2_fase2: Array = ["8", "5", "6", "7"]

var pergunta_nivel2_fase3: String = "10-4"
var resposta_nivel2_fase3: String = "6"
var opcoes_nivel2_fase3: Array = ["11", "12", "6", "93"]

var pergunta_nivel2_fase4: String = "15-4"
var resposta_nivel2_fase4: String = "11"
var opcoes_nivel2_fase4: Array = ["78", "16", "11", "7"]

##### FASE 3 ##### OPERA��ES MENOS SIMPLES DE ADI��O #####
var pergunta_nivel3_fase1: String = "2+4+3"
var resposta_nivel3_fase1: String = "9"
var opcoes_nivel3_fase1: Array = ["4", "6", "2", "9"]

var pergunta_nivel3_fase2: String = "5+2+3"
var resposta_nivel3_fase2: String = "10"
var opcoes_nivel3_fase2: Array = ["8", "5", "10", "7"]

var pergunta_nivel3_fase3: String = "9+3+2"
var resposta_nivel3_fase3: String = "14"
var opcoes_nivel3_fase3: Array = ["11", "12", "6", "14"]

var pergunta_nivel3_fase4: String = "7+2+3"
var resposta_nivel3_fase4: String = "12"
var opcoes_nivel3_fase4: Array = ["78", "12", "14", "18"]

##### FASE 4 ##### OPERA��ES MENOS SIMPLES DE SUBTRA��O #####
var pergunta_nivel4_fase1: String = "8-2-1"
var resposta_nivel4_fase1: String = "5"
var opcoes_nivel4_fase1: Array = ["4", "6", "2", "5"]

var pergunta_nivel4_fase2: String = "9-3-1"
var resposta_nivel4_fase2: String = "5"
var opcoes_nivel4_fase2: Array = ["8", "5", "6", "7"]

var pergunta_nivel4_fase3: String = "10-4-2"
var resposta_nivel4_fase3: String = "4"
var opcoes_nivel4_fase3: Array = ["11", "12", "6", "4"]

var pergunta_nivel4_fase4: String = "15-5-3"
var resposta_nivel4_fase4: String = "7"
var opcoes_nivel4_fase4: Array = ["78", "16", "14", "7"]

##### FASE 5 ##### OPERA��ES SIMPLES DE MULTIPLICA��O #####
var pergunta_nivel5_fase1: String = "2x4"
var resposta_nivel5_fase1: String = "8"
var opcoes_nivel5_fase1: Array = ["4", "6", "2", "8"]

var pergunta_nivel5_fase2: String = "5x2"
var resposta_nivel5_fase2: String = "10"
var opcoes_nivel5_fase2: Array = ["8", "5", "10", "7"]

var pergunta_nivel5_fase3: String = "9x2"
var resposta_nivel5_fase3: String = "18"
var opcoes_nivel5_fase3: Array = ["11", "12", "18", "27"]

var pergunta_nivel5_fase4: String = "3x3"
var resposta_nivel5_fase4: String = "9"
var opcoes_nivel5_fase4: Array = ["6", "9", "33", "0"]

##### FASE 6 ##### OPERA��ES SIMPLES DE DIVIS�O #####
var pergunta_nivel6_fase1: String = "8/2"
var resposta_nivel6_fase1: String = "4"
var opcoes_nivel6_fase1: Array = ["4", "6", "2", "8"]

var pergunta_nivel6_fase2: String = "2/1"
var resposta_nivel6_fase2: String = "1"
var opcoes_nivel6_fase2: Array = ["8", "1", "10", "3"]

var pergunta_nivel6_fase3: String = "10/2"
var resposta_nivel6_fase3: String = "5"
var opcoes_nivel6_fase3: Array = ["11", "12", "6", "5"]

var pergunta_nivel6_fase4: String = "9/3"
var resposta_nivel6_fase4: String = "3"
var opcoes_nivel6_fase4: Array = ["3", "16", "14", "5"]

##### FASE 7 ##### OPERA��ES SIMPLES DE ADI��O E SUBTRA��O #####
var pergunta_nivel7_fase1: String = "2+4-1"
var resposta_nivel7_fase1: String = "5"
var opcoes_nivel7_fase1: Array = ["4", "6", "2", "5"]

var pergunta_nivel7_fase2: String = "5+2-1"
var resposta_nivel7_fase2: String = "6"
var opcoes_nivel7_fase2: Array = ["8", "5", "6", "7"]

var pergunta_nivel7_fase3: String = "9+3-2"
var resposta_nivel7_fase3: String = "10"
var opcoes_nivel7_fase3: Array = ["11", "12", "6", "10"]

var pergunta_nivel7_fase4: String = "7+8-3"
var resposta_nivel7_fase4: String = "12"
var opcoes_nivel7_fase4: Array = ["78", "16", "14", "12"]

##### FASE 8 #### OPERA��ES MUITO SIMPLES DE MULTIPLI��O, ADI��O, SUBTRA��O E DIVIS�O #####
var pergunta_nivel8_fase1: String = "2x4+1"
var resposta_nivel8_fase1: String = "9"
var opcoes_nivel8_fase1: Array = ["4", "6", "2", "9"]

var pergunta_nivel8_fase2: String = "5x2-1"
var resposta_nivel8_fase2: String = "9"
var opcoes_nivel8_fase2: Array = ["8", "5", "9", "7"]

var pergunta_nivel8_fase3: String = "6/2-1"
var resposta_nivel8_fase3: String = "2"
var opcoes_nivel8_fase3: Array = ["11", "12", "6", "2"]

var pergunta_nivel8_fase4: String = "2/1+2"
var resposta_nivel8_fase4: String = "4"
var opcoes_nivel8_fase4: Array = ["4", "16", "23", "5"]


func _ready():
	get_tree().paused = false
	music2.stop()
	buttonSound.stop()
	buttonBackSound.stop()
	fasesDesbloqueadas = _load()


func _process(_delta):
	if musicOn:
		soundOff.visible = false
	else:
		soundOff.visible = true


func _load() -> int:
	var file = FileAccess.open(fileData, FileAccess.READ)
	var content = file.get_as_text()
	if content == "":
		return 1
	return int(content)
