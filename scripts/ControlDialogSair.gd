extends Control


func _ready():
	get_node("ButtonClaro").pressed.connect(_on_exit)


func _on_exit():
	get_tree().quit()
