extends Node2D

@onready var sceneActive = false
@onready var menu: Node2D = get_parent().get_node("MainMenu")
@onready var root: Node2D = get_parent()

#Aqui serve para alterar a movimenta��o dos bal�es
@onready var ballon01: Area2D = $Ballon01
@onready var ballon02: Area2D = $Ballon02
@onready var ballon03: Area2D = $Ballon03
@onready var ballon04: Area2D = $Ballon04
@onready var ballon05: Area2D = $Ballon05
@onready var ballon06: Area2D = $Ballon06


@onready var arara: Sprite2D = $AraraAzul/AraraAzulSprite
@onready var araraCharacter: CharacterBody2D = $AraraAzul
@onready var vidas: Sprite2D = $Vida
@onready var errouMessagem: Sprite2D = $Errado
@onready var acertouMessagem: Sprite2D = $Correto

@onready var labelPergunta: Label = $Pergunta/Label
@onready var respostaCorreta:String = root.resposta1

var balaoAtingido: bool = false

var shouldDelay = true

var startPosition: Vector2 = Vector2(100, 100)
var targetPosition: Vector2 = Vector2(200, 200)

@onready var baloes = [ballon01, ballon02, ballon03, ballon04, ballon05, ballon06]  # Lista de bal�es dispon�veis
@onready var quantidadeDesativar:int = 2;  # Quantidade de bal�es a serem desativados

@onready var line2D: Line2D = $Line2D


func _ready():
	self.visible = false
	acertouMessagem.visible = false
	errouMessagem.visible = false
	# $Timer.connect("timeout", _on_Timer_timeout)

	
	# Modificar as propriedades do Line2D
	line2D.default_color = Color(1, 1, 1)
	line2D.width = 2
	line2D.antialiased = true

	var positionAX = line2D.get_point_position(0).x
	var positionAY = line2D.get_point_position(0).y
	var positionBX = line2D.get_point_position(1).x
	var positionBY = line2D.get_point_position(1).y

	# Definir os pontos de controle iniciais
	var startPoint = Vector2(positionAX, positionAY)
	var endPoint = Vector2(positionBX, positionBY)
	line2D.points = [startPoint, endPoint]

	# Desativa bal�es aleat�rios
	for i in range(quantidadeDesativar):
		var randomIndex = randi() % baloes.size()
		var balao = baloes[randomIndex]
		balao.visible = false
		balao.collisionActive = false
		baloes.remove_at(randomIndex)
	
	_set_text_ballons(root.opcoes1)
	labelPergunta.set_text(root.pergunta1)
	print(root.vidas)
	if root.vidas == 3:
		vidas.texture = load("res://assets//interface//3vidas.png")
	elif root.vidas == 2:
		vidas.texture = load("res://assets//interface//2vidas.png")
	elif root.vidas == 1:
		vidas.texture = load("res://assets//interface//1vidas.png")
	elif root.vidas == 0:
		vidas.texture = load("res://assets//interface//0vidas.png")

# func _reset_fase():

# Fun��o para definir o texto dos bal�es
func _set_text_ballons(texts):
	for i in range(texts.size()):
		var balao = baloes[i]
		balao.get_node("Label").set_text(texts[i])

func _process(_delta) -> void:
	#draw_line(Vector2.ZERO, Vector2.RIGHT * 300, Color.WHITE, 0.8)
	if sceneActive:
		self.visible = true
		# if balaoAtingido:
		# 	# arara.visible = false
		# 	# arara.isMoving = false
		# 	# araraCharacter.isMoving = false
		# 	# ballon01.is_moving = false
		# 	# ballon02.is_moving = false
		# 	# ballon03.is_moving = false
		# 	# ballon04.is_moving = false
		# 	# ballon05.is_moving = false
		# 	# ballon06.is_moving = false
		# 	if shouldDelay:
		# 		$Timer.start()
		# 		shouldDelay = false
		# 		arara.isMoving = false
		# 		araraCharacter.isMoving = false
				
	else:
		self.visible = false

# func _on_Timer_timeout():
# 	ballon01.is_moving = false
# 	ballon02.is_moving = false
# 	ballon03.is_moving = false
# 	ballon04.is_moving = false
# 	ballon05.is_moving = false
# 	ballon06.is_moving = false
# 	if respostaCerta:
# 		acertouMessagem.visible = true
# 	else:
# 		errouMessagem.visible = true


func _on_ballon_01_body_entered(body):
	print(body)
	pass  # Replace with function body
func _balao_atingido():
	arara.isMoving = false
	araraCharacter.isMoving = false
	ballon01.is_moving = false
	ballon02.is_moving = false
	ballon03.is_moving = false
	ballon04.is_moving = false
	ballon05.is_moving = false
	ballon06.is_moving = false

func _verificar_acerto(resp: String):
	if resp == respostaCorreta:
		print("Acertou!")
		errouMessagem.visible = false
		acertouMessagem.visible = true
		_balao_atingido()
	else:
		print("Errou!")
		errouMessagem.visible = true
		acertouMessagem.visible = false
		_balao_atingido()



##s�o os sinais emitidos pelos baloes
#as labels ser�o para comparar o que a arara acertou
func _on_ballon_01_atingido(label: String):
	balaoAtingido = true
	_verificar_acerto(label)

func _on_ballon_02_atingido(label: String):
	balaoAtingido = true
	_verificar_acerto(label)

func _on_ballon_03_atingido(label: String):
	balaoAtingido = true
	_verificar_acerto(label)

func _on_ballon_04_atingido(label: String):
	balaoAtingido = true
	_verificar_acerto(label)

func _on_ballon_05_atingido(label: String):
	balaoAtingido = true
	_verificar_acerto(label)

func _on_ballon_06_atingido(label: String):
	balaoAtingido = true
	_verificar_acerto(label)
