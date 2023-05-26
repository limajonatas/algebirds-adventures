extends Node2D

@onready var label: Label = $Ballon01/Label

func _ready():
	# Definir o texto inicial
	label.set_text("")

	# Ou você pode definir o texto usando uma variável
	var texto = "2*2"
	label.set_text(texto)
