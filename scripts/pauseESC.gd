extends Node2D

@onready var canva: CanvasLayer = $CanvasLayer
@onready var sceneActive = false
@onready var pai: Node2D = get_parent()


# Called when the node enters the scene tree for the first time.
func _ready():
	canva.visible = false
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if pai.sceneActive:
		if Input.is_action_just_pressed("pause"):
			#ativa o pause
			if get_tree().paused == false:
				get_tree().paused = true
				canva.visible = true
				sceneActive = true
			else:
				get_tree().paused = false
				canva.visible = false
				sceneActive = false
	else:
		canva.visible = false
		get_tree().paused = false


func _on_voltar_voltar():
	get_tree().paused = false
	canva.visible = false


func _on_pausa_pausar():
	get_tree().paused = true
	canva.visible = true
