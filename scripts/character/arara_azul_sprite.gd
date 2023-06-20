extends Sprite2D
@onready var paiNivel = get_parent().get_parent()
var cont:int = 0
var isMoving: bool = false
var activeInput: bool = true


func _input(event: InputEvent) -> void:
	if paiNivel.sceneActive:
		if event is InputEventKey and !isMoving and activeInput:
			var key_event := event as InputEventKey
			if key_event.is_action_pressed("jump"):
				isMoving = true
			if key_event.is_action_pressed("ui_down"):
				if cont > -3:
					# Define a nova posi��o do sprite
					if cont == 3:
						self.rotation = deg_to_rad(-8)
						self.position = Vector2(-8, -6)
					elif cont == 2:
						self.rotation = deg_to_rad(-2)
						self.position = Vector2(-3, -3)
					elif cont == 1:
						self.rotation = deg_to_rad(0)
						self.position = Vector2(0, 0)
					elif cont == 0:
						self.rotation = deg_to_rad(6)
						self.position = Vector2(4, 4)
					elif cont == -1:
						self.rotation = deg_to_rad(13)
						self.position = Vector2(9, 12)
					elif cont == -2:
						self.rotation = deg_to_rad(23)
						self.position = Vector2(14, 19)

					cont -= 1
			elif key_event.is_action_pressed("ui_up"):
				if cont < 2:
					if cont == -3:
						self.rotation = deg_to_rad(13)
						self.position = Vector2(9, 12)
					elif cont == -2:
						self.rotation = deg_to_rad(6)
						self.position = Vector2(4, 4)
					elif cont == -1:
						self.rotation = deg_to_rad(0)
						self.position = Vector2(0, 0)
					elif cont == 0:
						self.rotation = deg_to_rad(-2)
						self.position = Vector2(-3, -3)
					elif cont == 1:
						self.rotation = deg_to_rad(-8)
						self.position = Vector2(-8, -6)
					elif cont == 2:
						self.rotation = deg_to_rad(-17)
						self.position = Vector2(-14, -7)

					cont += 1

func _reset():
	cont = 0
	self.rotation = deg_to_rad(0)
	self.position = Vector2(0, 0)
	activeInput = true
