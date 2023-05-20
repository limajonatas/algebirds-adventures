extends Sprite2D
var cont := 0;
func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var key_event := event as InputEventKey
		
		if key_event.is_action_pressed("ui_down"):
			if cont > -3:
				cont -= 1
				var rotation_angle = deg_to_rad(10) # Define o ângulo de rotação (15 graus)
				var translation_offset := Vector2();
				if cont+1 == 0:
					translation_offset = Vector2(6, 5) # Define o deslocamento de posição (10 unidades em x e y)
				elif cont+1 == -1:
					translation_offset = Vector2(5, 10)
				elif cont+1 == -2:
					rotation_angle = deg_to_rad(11)
					translation_offset = Vector2(4, 15)
					
				# Define a rotação do sprite
				self.rotation += rotation_angle
				
				# Define a nova posição do sprite
				self.position += translation_offset
				
		elif key_event.is_action_pressed("ui_up"):
			#transforma o sprite rotaciona um pouco para esquerda (abaixo de 0 grau) e mudar um pouco a posicao para cima e para esquerda"
			if cont > 3:
				cont += 1
				var rotation_angle = deg_to_rad(-15) # Define o ângulo de rotação (-15 graus)
				var translation_offset = Vector2(-10, -10) # Define o deslocamento de posição (-10 unidades em x e y)
				
				# Define a rotação do sprite
				self.rotation += rotation_angle
				
				# Define a nova posição do sprite
				self.position += translation_offset
