extends Node2D

@onready var canva: CanvasLayer = $CanvasLayer
var ativo = false


# Called when the node enters the scene tree for the first time.
func _ready():
	canva.visible = false
	get_tree().paused = true
	ativo = false


func _on_nao_sair_nao_sair():
	canva.visible = false


func _on_sair_sair_do_jogo():
	canva.visible = true
	ativo = true
