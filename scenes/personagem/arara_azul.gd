extends CharacterBody2D

var animationPlayer: AnimationPlayer
var sprite: Sprite2D
var isMoving: bool = false
var moveDirection: Vector2
var canhao_position: int = 0
var gravity: float = 1000 # Valor da gravidade inicial
var currentSpeed: float = 1200 # Velocidade inicial
var speedReductionRate: float = 0.99 # Taxa de redução da velocidade (0.999 reduz em 0.1% a cada iteração)
var descentRate: float = 10 # Taxa de inclinação da curva descendente (valores menores criam uma curva mais acentuada)

func _ready():
	print(canhao_position)
	# Obtenha uma referência para o AnimationPlayer e o Sprite
	animationPlayer = $AnimationPlayer
	sprite = $AraraAzulSprite

func _input(event: InputEvent) -> void:
	if event is InputEventKey:
		var key_event := event as InputEventKey
		if key_event.is_action_pressed("jump") and !isMoving:
			# Inicie a animação "voo" no AnimationPlayer
			animationPlayer.play("voo")
			
			# Defina a direção do movimento
			var moveAngle = -21
			if(canhao_position == 3):
				moveAngle = -42
			if(canhao_position == 2):
				moveAngle = -34
			if(canhao_position == 1):
				moveAngle = -28
			if(canhao_position == -1):
				moveAngle = -13
			if(canhao_position == -2):
				moveAngle = -8
			if(canhao_position == -3):
				moveAngle = 0
				
			# Ângulo em graus
			moveDirection = Vector2(cos(deg_to_rad(moveAngle)), sin(deg_to_rad(moveAngle))).normalized()
			
			# Inicie o movimento do personagem
			isMoving = true

func _physics_process(delta: float) -> void:
	var motion = moveDirection * currentSpeed
	if isMoving:
		motion += Vector2(0, gravity) * delta
		var collision = move_and_collide(motion * delta)
		
		# Verifique se houve colisão
		if collision:
			# Pare o movimento do personagem e defina isMoving como falso
			isMoving = false
			# Oculte o sprite
			sprite.visible = false
		
		gravity *= 1.04 #Aumente a gravidade para criar uma curva descendente
		
		currentSpeed *= speedReductionRate
		if currentSpeed < 1: # Valor mínimo de velocidade
			isMoving = false

# Será chamado externamente quando o canhão muda de direção
func _on_gun_cont_updated(value: int):
	canhao_position = value
