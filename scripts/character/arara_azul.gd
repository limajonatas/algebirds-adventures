extends CharacterBody2D

@onready var pai:Node2D = get_parent()
@onready var sceneActive:bool = false

var animationPlayer: AnimationPlayer
var sprite: Sprite2D
var isMoving: bool = false
var canhao_position: int = 0
var moveDirection: Vector2
var gravity: float = 1000  # Valor da gravidade inicial
var currentSpeed: float = 1200  # Velocidade inicial
var speedReductionRate: float = 0.99  # Taxa de redu��o da velocidade (0.999 reduz em 0.1% a cada itera��o)
# var descentRate: float = 10  # Taxa de inclina��o da curva descendente (valores menores criam uma curva mais acentuada)
var positionAraraCharacter: Vector2 = Vector2(0, 0)
@onready var saiuDaTela: bool = false

func _ready():
	# Obtenha uma refer�ncia para o AnimationPlayer e o Sprite
	animationPlayer = $AnimationPlayer
	sprite = $AraraAzulSprite
	positionAraraCharacter = self.get_position()


func _on_reset():
	self.position = positionAraraCharacter
	# moveDirection: Vector2
	gravity = 1000  # Valor da gravidade inicial
	currentSpeed = 1200
	animationPlayer.play("static")

func _input(event: InputEvent) -> void:
	if pai.sceneActive:
		if event is InputEventKey:
			var key_event := event as InputEventKey
			if key_event.is_action_pressed("jump") and !isMoving:
				# Inicie a anima��o "voo" no AnimationPlayer
				animationPlayer.play("voo")

				# Defina a dire��o do movimento
				var moveAngle = -21
				if canhao_position == 3:
					moveAngle = -42
				if canhao_position == 2:
					moveAngle = -34
				if canhao_position == 1:
					moveAngle = -28
				if canhao_position == -1:
					moveAngle = -13
				if canhao_position == -2:
					moveAngle = -8
				if canhao_position == -3:
					moveAngle = 0

				# �ngulo em graus
				moveDirection = (
					Vector2(cos(deg_to_rad(moveAngle)), sin(deg_to_rad(moveAngle))).normalized()
				)

				# Inicie o movimento do personagem
				isMoving = true

func _process(_delta):
	if pai.sceneActive:
		sceneActive = true;
		self.visible = true;
	else:
		sceneActive = false;
		self.visible = false;

func _physics_process(delta: float) -> void:
	if pai.sceneActive:
		var motion = moveDirection * currentSpeed
		if isMoving:
			motion += Vector2(0, gravity) * delta
			# var collision = 
			move_and_collide(motion * delta)

			## verificar se o personagem saiu da tela 1152x648
			if self.position.x > 1200 or self.position.x < -1200 or self.position.y > 700 or self.position.y < -700:
				# Pare o movimento do personagem e defina isMoving como falso
				isMoving = false
				print("Saiu da tela")
				saiuDaTela = true


			# Verifique se houve colis�o (n�o est� sendo utilizado)
			'''
			if collision:
				# Pare o movimento do personagem e defina isMoving como falso
				isMoving = false
				# Oculte o sprite
				sprite.visible = false
				
				# Identifique o objeto que colidiu
				var collidedObject = collision.collider
				
				# Fa�a algo com o objeto colidido
				if collidedObject.is_in_group("ballons"):
					# O objeto colidido pertence ao grupo "NomeDoGrupo"
					# Execute a��o espec�fica para esse objeto
					print("Colis�o com o objeto do grupo NomeDoGrupo detectada!")
				else:
					# O objeto colidido n�o pertence ao grupo "NomeDoGrupo"
					# Fa�a algo para outros casos de colis�o
					print("Colis�o detectada com um objeto fora do grupo NomeDoGrupo.")
		'''
			gravity *= 1.04  #Aumente a gravidade para criar uma curva descendente

			currentSpeed *= speedReductionRate
			if currentSpeed < 1:  # Valor m�nimo de velocidade
				isMoving = false


# Ser� chamado externamente quando o canh�o muda de dire��o
func _on_gun_cont_updated(value: int):
	canhao_position = value
