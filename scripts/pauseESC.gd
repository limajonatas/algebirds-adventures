extends Node2D

@onready var canva: CanvasLayer = $CanvasLayer
@onready var sceneActive = false
@onready var pai: Node2D = get_parent()
@onready var titlePause: Sprite2D = $CanvasLayer/Pause
@onready var titlePauseOption: Sprite2D = $CanvasLayer/OpcoesPause
@onready var optionsVisible = false
@onready var root:Node2D = get_parent().get_parent()
# @onready var buttonPause = get_parent().get_node("Pausa")

func _ready():
	canva.visible = false
	get_tree().paused = false


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
	root.buttonBackSound.play()
	get_tree().paused = false
	canva.visible = false

func _on_pausa_pausar():
	get_tree().paused = true
	canva.visible = true
