extends Node2D

@onready var sceneActive = false

# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false

func _process(_delta):
	if sceneActive:
		self.visible = true
	else:
		self.visible = false


