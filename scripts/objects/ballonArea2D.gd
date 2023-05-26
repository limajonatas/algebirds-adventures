extends Area2D

var speed = 30
var amplitude = 15
var initialY: float
var direction: int = 1
var animationPlayer: AnimationPlayer
var rng: RandomNumberGenerator

@onready var label: Label = $Label;

func _ready():
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

func _process(delta):
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

func _onBodyEntered(body: Node) -> void:
	if body is CharacterBody2D and body.is_in_group("characters"):
		# Um objeto CharacterBody atingiu o StaticBody2D
		var character = body as CharacterBody2D
		label.text = "Colidiu com " + character.name
		
		# Alterar a animação quando um objeto colidir
		animationPlayer.play("outra_animacao")

		# Ocultar a label quando um objeto colidir
		label.visible = false

 # Replace with function body.
