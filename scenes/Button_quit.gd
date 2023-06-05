extends Button

func _ready():
	var button = get_node("/root/Node2D/Main_menu/Button_quit")
	button.pressed.connect(_on_Button_pressed)

func _on_Button_pressed():
	get_tree().quit()
