extends Node2D

@onready var canva: CanvasLayer = $CanvasLayer
@onready var sceneActive = false
@onready var pai: Node2D = get_parent()
@onready var titlePause: Sprite2D = $CanvasLayer/Pause
@onready var titlePauseOption: Sprite2D = $CanvasLayer/OpcoesPause
@onready var optionsVisible = false


# Called when the node enters the scene tree for the first time.
func _ready():
	canva.visible = false
	get_tree().paused = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if optionsVisible:
		titlePause.visible = false
		titlePauseOption.visible = true
	else:
		titlePause.visible = true
		titlePauseOption.visible = false

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
				optionsVisible = false
	else:
		canva.visible = false
		get_tree().paused = false


func _on_voltar_voltar():
	get_tree().paused = false
	canva.visible = false


func _on_pausa_pausar():
	get_tree().paused = true
	canva.visible = true
