extends Node2D
@onready var fileData = "res://data/data.lvs.aa"
@onready var options: Node2D = $Options

var faseAtual: int = 1
var nivelAtual: int = 1
var fasesDesbloqueadas: int = 1
var vidas: int = 3

@onready var musicOn: bool = true
@onready var music: AudioStreamPlayer2D = $Music
@onready var music2: AudioStreamPlayer2D = $Music2
@onready var buttonSound: AudioStreamPlayer2D = $ButtonSound
@onready var buttonBackSound: AudioStreamPlayer2D = $ButtonBackSound
@onready var soundOff: Sprite2D = $SoundOff

# Array de perguntas e respostas por níveis e fases
var niveis = [
	# Nível 1 - Operações simples de adição
	{
		"perguntas": [
			{"pergunta": "1 + 1", "resposta": "2", "opcoes": ["1", "2", "3", "4"]},
			{"pergunta": "2 + 2", "resposta": "4", "opcoes": ["3", "4", "5", "6"]},
			{"pergunta": "1 + 3", "resposta": "4", "opcoes": ["2", "4", "3", "5"]},
			{"pergunta": "3 + 0", "resposta": "3", "opcoes": ["3", "4", "5", "1"]}
		]
	},
	# Nível 2 - Operações simples de adição
	{
		"perguntas": [
			{"pergunta": "3 + 4", "resposta": "7", "opcoes": ["6", "7", "5", "8"]},
			{"pergunta": "2 + 5", "resposta": "7", "opcoes": ["4", "6", "7", "8"]},
			{"pergunta": "1 + 6", "resposta": "7", "opcoes": ["5", "6", "7", "8"]},
			{"pergunta": "0 + 8", "resposta": "8", "opcoes": ["7", "8", "9", "6"]}
		]
	},
	# Nível 3 - Operações simples de subtração
	{
		"perguntas": [
			{"pergunta": "2 - 1", "resposta": "1", "opcoes": ["1", "2", "3", "4"]},
			{"pergunta": "5 - 2", "resposta": "3", "opcoes": ["2", "3", "4", "1"]},
			{"pergunta": "4 - 3", "resposta": "1", "opcoes": ["1", "2", "3", "4"]},
			{"pergunta": "6 - 1", "resposta": "5", "opcoes": ["4", "5", "6", "3"]}
		]
	},
	# Nível 4 - Operações simples de subtração
	{
		"perguntas": [
			{"pergunta": "5 - 4", "resposta": "1", "opcoes": ["1", "2", "3", "4"]},
			{"pergunta": "9 - 7", "resposta": "2", "opcoes": ["1", "2", "3", "4"]},
			{"pergunta": "8 - 3", "resposta": "5", "opcoes": ["4", "5", "6", "3"]},
			{"pergunta": "7 - 1", "resposta": "6", "opcoes": ["5", "6", "4", "3"]}
		]
	},
	# Nível 5 - Adição e subtração (misturadas)
	{
		"perguntas": [
			{"pergunta": "1 + 1 - 1", "resposta": "1", "opcoes": ["0", "1", "2", "3"]},
			{"pergunta": "2 + 2 - 1", "resposta": "3", "opcoes": ["2", "3", "4", "5"]},
			{"pergunta": "3 + 0 - 1", "resposta": "2", "opcoes": ["1", "2", "3", "4"]},
			{"pergunta": "5 - 2 + 1", "resposta": "4", "opcoes": ["3", "4", "5", "2"]}
		]
	},
	# Nível 6 - Adição e subtração (misturadas)
	{
		"perguntas": [
			{"pergunta": "4 + 1 - 2", "resposta": "3", "opcoes": ["2", "3", "4", "5"]},
			{"pergunta": "1 + 5 - 4", "resposta": "2", "opcoes": ["1", "2", "3", "4"]},
			{"pergunta": "6 - 3 + 2", "resposta": "5", "opcoes": ["4", "5", "6", "3"]},
			{"pergunta": "2 + 3 - 1", "resposta": "4", "opcoes": ["3", "4", "5", "6"]}
		]
	},
	# Nível 7 - Multiplicação super fácil
	{
		"perguntas": [
			{"pergunta": "1 x 1", "resposta": "1", "opcoes": ["1", "2", "3", "4"]},
			{"pergunta": "2 x 1", "resposta": "2", "opcoes": ["1", "2", "6", "4"]},
			{"pergunta": "2 x 2", "resposta": "4", "opcoes": ["5", "2", "3", "4"]},
			{"pergunta": "3 x 1", "resposta": "3", "opcoes": ["3", "4", "5", "6"]}
		]
	},
	# Nível 8 - Multiplicação super fácil
	{
		"perguntas": [
			{"pergunta": "3 x 2", "resposta": "6", "opcoes": ["2", "6", "4", "5"]},
			{"pergunta": "4 x 1", "resposta": "4", "opcoes": ["3", "4", "5", "6"]},
			{"pergunta": "3 x 2", "resposta": "6", "opcoes": ["1", "6", "3", "7"]},
			{"pergunta": "3 x 3", "resposta": "9", "opcoes": ["9", "6", "7", "8"]}
		]
	},
	# Nível 9 - Divisão super fácil
	{
		"perguntas": [
			{"pergunta": "4 ÷ 2", "resposta": "2", "opcoes": ["2", "1", "4", "5"]},
			{"pergunta": "3 ÷ 1", "resposta": "3", "opcoes": ["1", "2", "3", "4"]},
			{"pergunta": "2 ÷ 2", "resposta": "1", "opcoes": ["1", "2", "3", "4"]},
			{"pergunta": "6 ÷ 3", "resposta": "2", "opcoes": ["2", "3", "4", "5"]}
		]
	},
	# Nível 10 - Divisão super fácil
	{
		"perguntas": [
			{"pergunta": "9 ÷ 3", "resposta": "3", "opcoes": ["2", "3", "4", "5"]},
			{"pergunta": "10 ÷ 2", "resposta": "5", "opcoes": ["3", "4", "5", "6"]},
			{"pergunta": "8 ÷ 2", "resposta": "4", "opcoes": ["2", "3", "4", "5"]},
			{"pergunta": "12 ÷ 6", "resposta": "2", "opcoes": ["2", "3", "4", "5"]}
		]
	}
]


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

func _on_music_2_finished():
	music2.play()

# Função para pegar perguntas por nível e fase
func get_pergunta(nivel: int, fase: int) -> Dictionary:
	if nivel <= niveis.size():
		if fase <= niveis[nivel - 1]["perguntas"].size():
			return niveis[nivel - 1]["perguntas"][fase - 1]
	return {}

