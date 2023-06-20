extends Sprite2D
signal cont_updated(value: int)
var cont := 0
var isMoving: bool = false
var activeInput: bool = true
@onready var pai:Node2D = get_parent()
@onready var sound: AudioStreamPlayer2D = $Sound

func _ready():
	sound.stop()
	emit_signal("cont_updated", cont)

func _reset():
	activeInput = true
	cont=0
	# emit_signal("cont_updated", cont)
	_update()

func _input(event: InputEvent) -> void:
	if pai.sceneActive:
		if event is InputEventKey and !isMoving and activeInput:
			var key_event := event as InputEventKey
			# var texture_path := ""
			if key_event.is_action_pressed("jump"):
				sound.play()
				isMoving = true
				
			if key_event.is_action_pressed("ui_down"):
				#Atualize a textura para a apar�ncia "para baixo"
				if cont > -3:
					cont -= 1
					_update()
					# if cont < 0:
					# 	texture_path = "res://assets/objects/gun-" + str(abs(cont)) + ".png"
					# else:
					# 	texture_path = "res://assets/objects/gun" + str(cont) + ".png"
					# texture = load(texture_path)
					# emit_signal("cont_updated", cont)  # Emitir o sinal com o valor atualizado de 'cont'

			elif key_event.is_action_pressed("ui_up"):
				# Atualize a textura para a apar�ncia "para cima"
				if cont < 2:
					cont += 1
					_update()
					# if cont < 0:
					# 	texture_path = "res://assets/objects/gun-" + str(abs(cont)) + ".png"
					# else:
					# 	texture_path = "res://assets/objects/gun" + str(cont) + ".png"
					# texture = load(texture_path)
					# emit_signal("cont_updated", cont)  # Emitir o sinal com o valor atualizado de 'cont'

func _update():
	var texture_path := ""
	if cont < 0:
		texture_path = "res://assets/objects/gun-" + str(abs(cont)) + ".png"
	else:
		texture_path = "res://assets/objects/gun" + str(cont) + ".png"
	texture = load(texture_path)
	emit_signal("cont_updated", cont)  # Emitir o sinal com o valor atualizado de 'cont'
