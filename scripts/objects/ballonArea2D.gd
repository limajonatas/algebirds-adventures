extends Area2D

@onready var pai: Node2D = get_parent()
var speed = 30
var amplitude = 15
var initialY: float
var direction: int = 1
var animationPlayer: AnimationPlayer
var rng: RandomNumberGenerator
var is_moving: bool = false
var collisionActive: bool = true
@onready var label: Label = $Label
@onready var collision: CollisionShape2D = $CollisionShape2D
@onready var sound: AudioStreamPlayer2D  = $Sound
signal atingido(value: bool, label: Label)


func _ready():
	sound.stop()
	initialY = position.y
	animationPlayer = $AnimationPlayer

	rng = RandomNumberGenerator.new()
	rng.randomize()
	# var numeroAleatorio = rng.randi_range(1, 6)
	# var animationNumber = "main0" + str(numeroAleatorio)
	
	# #escolher uma animação aleat�ria (a cor do balao)
	# animationPlayer.play(animationNumber)

	# Gerar um n�mero aleat�rio (0 ou 1)
	var randomDirection = rng.randi_range(0, 1)

	# Definir a dire��o inicial com base no n�mero aleat�rio
	direction = directionVerify(randomDirection)

	is_moving = true


func _process(delta):
	if pai.sceneActive:
		if collisionActive == false:
			collision.disabled = true
		else:
			collision.disabled = false
			
		if is_moving:
			position.y += speed * delta * direction

			# Verifica se o objeto atingiu a amplitude desejada ou voltou � posi��o inicial
			if position.y >= initialY + amplitude:
				direction = -1
			elif position.y <= initialY:
				direction = 1
	


func directionVerify(random: int) -> int:
	if random == 0:
		return -1
	else:
		return 1

func _set_label_text(text: String):
	label.text = text
	label.visible = true

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:  # Verifica se o objeto que colidiu � do tipo CharacterBody
		# Fa�a algo quando um CharacterBody colidir com a �rea2D
		animationPlayer.play("pow")
		label.visible = false
		is_moving = false
		sound.play()
		# print('ACERTOU BALÃO: ', label.text)
		emit_signal("atingido", label.text)
