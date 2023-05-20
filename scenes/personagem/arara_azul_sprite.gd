extends Sprite2D
var cont := 0

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var key_event := event as InputEventKey
		
		if key_event.is_action_pressed("ui_down"):
			if cont > -3:
				#var rotation_angle = deg_to_rad(8) # Define o ângulo de rotação (8 graus)
				
				
				# Define a rotação do sprite
				#self.rotation += rotation_angle
				
				# Define a nova posição do sprite
				if cont == 3:
					self.rotation = deg_to_rad(-13)
					self.position = Vector2(-10, -7)
				elif cont == 2:
					self.rotation = deg_to_rad(-2)
					self.position = Vector2(-4, -4)
				elif cont == 1:
					self.rotation = deg_to_rad(0)
					self.position = Vector2(0, 0)
				elif cont == 0:
					self.rotation = deg_to_rad(6)
					self.position = Vector2(4, 4)
				elif cont == -1:
					self.rotation = deg_to_rad(13)
					self.position = Vector2(8, 15)
				elif cont == -2:
					self.rotation = deg_to_rad(26)
					self.position = Vector2(13, 30)
					
				cont -= 1	
		elif key_event.is_action_pressed("ui_up"):
			if cont < 3:
				# Define a rotação do sprite
				#self.rotation += rotation_angle
				
				if cont == -3:
					self.rotation = deg_to_rad(13)
					self.position = Vector2(8, 15) 
					
				elif cont == -2:
					self.rotation = deg_to_rad(6)
					self.position = Vector2(4, 4)
				elif cont == -1:
					self.rotation = deg_to_rad(0)
					self.position = Vector2(0, 0)
				elif cont == 0:
					self.rotation = deg_to_rad(-2)
					self.position = Vector2(-4, -4)
				elif cont == 1:
					self.rotation = deg_to_rad(-13)
					self.position = Vector2(-10, -7)
				elif cont == 2:
					self.rotation = deg_to_rad(-22)
					self.position = Vector2(-17, -10)
					
				cont += 1
