extends Node2D

@onready var canva: CanvasLayer = $CanvasLayer;
# Called when the node enters the scene tree for the first time.
func _ready():
	canva.visible=false
	get_tree().paused = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed('pause'):
		if get_tree().paused == false:
			get_tree().paused = true
			canva.visible=true
		else:
			get_tree().paused = false
			canva.visible=false

func _on_voltar_voltar():
	get_tree().paused = false
	canva.visible=false

func _on_pausa_pausar():
	get_tree().paused = true
	canva.visible=true
