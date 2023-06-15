extends Node2D
@onready var sceneActive = false
@onready var menuPrincipal = get_parent().get_node("MainMenu")
@onready var root: Node2D = get_parent()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	self.visible = sceneActive
	if sceneActive:
		root.music.stop()

func _on_button_menu_menu_principal():
	sceneActive = false
	menuPrincipal.sceneActive = true
	root.music.play()


func _on_button_restart_restart_fase():
	pass  # Replace with function body.
