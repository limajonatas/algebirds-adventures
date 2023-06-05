extends Button

func _ready():
	var button = get_node("/root/Node2D/Control/Button")
	button.pressed.connect(_on_Button_pressed)

func _on_Button_pressed():
	get_tree().quit()
