extends CharacterBody2D

var animationPlayer: AnimationPlayer
var sprite: Sprite2D
var isMoving: bool = false
var moveDirection: Vector2
var canhao_position:int = 0


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
			var moveAngle = -25
			if(canhao_position == -1):
				moveAngle = -13
			if(canhao_position == -2):
				moveAngle = -9
			if(canhao_position == -3):
				moveAngle = 0
				
			# Ângulo em graus (exemplo: 45 graus)
			moveDirection = Vector2(cos(deg_to_rad(moveAngle)), sin(deg_to_rad(moveAngle))).normalized()
			
			# Inicie o movimento do personagem
			isMoving = true

func _physics_process(delta: float) -> void:
	if isMoving:
		var moveSpeed = 500 # Velocidade de movimento desejada
		var motion = moveDirection * moveSpeed
		var collision = move_and_collide(motion * delta)
		
		# Verifique se houve colisão
		if collision:
			# Pare o movimento do personagem e defina isMoving como falso
			isMoving = false
			

			# Verifique se houve colisão
			if collision:
				# Oculte o sprite
				sprite.visible = false

#será chamado externamente quando o canhao muda de direcao
func _on_gun_cont_updated(value:int):
	canhao_position = value
