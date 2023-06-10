extends Node2D

@export var teste = "teste"
@onready var options: Node2D = $Options
@onready var faseAtual: int = 1
@export var fasesDesbloqueadas: int = 1


func _ready():
	get_tree().paused = false
	teste = "teste2"
