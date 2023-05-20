extends Sprite2D

var cont := 0;
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var key_event := event as InputEventKey
		var texture_path := ''
		if key_event.is_action_pressed("ui_down"):
			#Atualize a textura para a aparência "para baixo"
			if cont > -3:
				cont -= 1
				if(cont < 0):
					texture_path = "res://assets/objects/gun-" + str(abs(cont)) + ".png"
				else:
					texture_path = "res://assets/objects/gun" + str(cont) + ".png"					
				texture = load(texture_path)
				
		elif key_event.is_action_pressed("ui_up"):
			# Atualize a textura para a aparência "para cima"
			if cont < 3:
				cont += 1
				if(cont < 0):
					texture_path = "res://assets/objects/gun-" + str(abs(cont)) + ".png"					
				else:
					texture_path = "res://assets/objects/gun" + str(cont) + ".png"
				texture = load(texture_path)


