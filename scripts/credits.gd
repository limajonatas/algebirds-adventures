extends Node2D

@onready var sceneActive = false


func _ready():
	self.visible = false


func _process(_delta):
	if sceneActive:
		self.visible = true
	else:
		self.visible = false
