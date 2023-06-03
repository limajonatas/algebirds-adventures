extends Area2D

var speed = 30
var amplitude = 15
var initialY: float
var direction: int = 1
var animationPlayer: AnimationPlayer
var rng: RandomNumberGenerator
var is_moving: bool = false
@onready var label: Label = $Label;
signal atingido(value: bool, label: Label )

func _ready():
	add_to_group("balloons")
	initialY = position.y
	animationPlayer = $AnimationPlayer
	
	rng = RandomNumberGenerator.new()
	rng.randomize()
	var numeroAleatorio = rng.randi_range(1, 6)
	var animationNumber = "main0"+str(numeroAleatorio)

	animationPlayer.play(animationNumber)
	
	# Gerar um número aleatório (0 ou 1)
	var randomDirection = rng.randi_range(0, 1)

	# Definir a direção inicial com base no número aleatório
	direction = directionVerify(randomDirection)
	
	is_moving = true

func _process(delta):
	if(is_moving):
		position.y += speed * delta * direction

		# Verifica se o objeto atingiu a amplitude desejada ou voltou à posição inicial
		if position.y >= initialY + amplitude:
			direction = -1
		elif position.y <= initialY:
			direction = 1
		
func directionVerify(random: int ) -> int:
	if random == 0:
		return -1;
	else:
		return 1;

func _on_body_entered(body: Node) -> void:
	if body is CharacterBody2D:  # Verifica se o objeto que colidiu é do tipo CharacterBody
		# Faça algo quando um CharacterBody colidir com a Área2D
		print("Um CharacterBody colidiu com a Área2D!", body)
		animationPlayer.play('pow')
		label.visible = false
		is_moving = false
		emit_signal("atingido", true, label)
		
		
		
		
		
