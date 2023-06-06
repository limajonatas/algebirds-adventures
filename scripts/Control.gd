extends Control

@onready var fase: Node2D = $Nivel

#4 perguntas
var perguntas = [
	{
		"pergunta": "2+2",
		"opcoes": ["4", "5", "6", "7"],
		"resposta": 4
	},
	{
		"pergunta": "2+3",
		"opcoes": ["4", "5", "6", "7"],
		"resposta": 5
	},
	{
		"pergunta": "2+4",
		"opcoes": ["4", "5", "6", "7"],
		"resposta": 6
	},
	{
		"pergunta": "2+5",
		"opcoes": ["4", "5", "6", "7"],
		"resposta": 7
	}
]


func _ready():
	fase.pergunta.set_text(perguntas[0]["pergunta"])
	fase._set_text_ballons(perguntas[0]["opcoes"])
	fase.resposta = perguntas[0]["resposta"]
