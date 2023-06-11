extends Sprite2D
signal cont_updated(value: int)
var cont := 0
var isMoving: bool = false

@onready var pai:Node2D = get_parent()

func _ready():
	emit_signal("cont_updated", cont)


func _input(event: InputEvent) -> void:
	if pai.sceneActive:
		if event is InputEventKey:
			var key_event := event as InputEventKey
			var texture_path := ""
			if key_event.is_action_pressed("jump") and !isMoving:
				isMoving = true
				
			if key_event.is_action_pressed("ui_down") and !isMoving:
				#Atualize a textura para a apar�ncia "para baixo"
				if cont > -3:
					cont -= 1
					if cont < 0:
						texture_path = "res://assets/objects/gun-" + str(abs(cont)) + ".png"
					else:
						texture_path = "res://assets/objects/gun" + str(cont) + ".png"
					texture = load(texture_path)
					emit_signal("cont_updated", cont)  # Emitir o sinal com o valor atualizado de 'cont'

			elif key_event.is_action_pressed("ui_up") and !isMoving:
				# Atualize a textura para a apar�ncia "para cima"
				if cont < 2:
					cont += 1
					if cont < 0:
						texture_path = "res://assets/objects/gun-" + str(abs(cont)) + ".png"
					else:
						texture_path = "res://assets/objects/gun" + str(cont) + ".png"
					texture = load(texture_path)
					emit_signal("cont_updated", cont)  # Emitir o sinal com o valor atualizado de 'cont'
