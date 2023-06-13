extends Node2D

@onready var sceneActive = false
@onready var reseted = false
@onready var menu: Node2D = get_parent().get_node("MainMenu")
@onready var root: Node2D = get_parent()

#Aqui serve para alterar a movimenta��o dos bal�es
@onready var ballon01: Area2D = $Ballon01
@onready var ballon02: Area2D = $Ballon02
@onready var ballon03: Area2D = $Ballon03
@onready var ballon04: Area2D = $Ballon04
@onready var ballon05: Area2D = $Ballon05
@onready var ballon06: Area2D = $Ballon06
var rng: RandomNumberGenerator


@onready var arara: Sprite2D = $AraraAzul/AraraAzulSprite
@onready var canhao: Sprite2D = $Gun
@onready var araraCharacter: CharacterBody2D = $AraraAzul
# var positionAraraCharacter: Vector2 = Vector2(0, 0)
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
# @onready var baloesAux = [ballon01, ballon02, ballon03, ballon04, ballon05, ballon06] 
@onready var quantidadeDesativar:int = 2;  # Quantidade de bal�es a serem desativados

@onready var line2D: Line2D = $Line2D


func _ready():
	self.visible = false
	acertouMessagem.visible = false
	errouMessagem.visible = false
	$Timer.connect("timeout", _reset_fase)

	
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
	_configura_baloes()

func _configura_baloes():
	# Desativa bal�es aleat�rios
	baloes = [ballon01, ballon02, ballon03, ballon04, ballon05, ballon06]
	for i in range(quantidadeDesativar):
		var randomIndex = randi() % baloes.size()
		var balao = baloes[randomIndex]
		balao.visible = false
		balao.collisionActive = false
		baloes.remove_at(randomIndex)

	#definição da animação
	for i in range(baloes.size()):
		var balao = baloes[i]
		balao.collisionActive = true
		balao.visible = true
		rng = RandomNumberGenerator.new()
		rng.randomize()
		var animationNumber = "main0" + str(rng.randi_range(1, 6))
		balao.animationPlayer.play(animationNumber)
		balao.is_moving = true

	for i in range(root.opcoes1.size()):
		baloes[i].get_node("Label").set_text(root.opcoes1[i])

	labelPergunta.set_text(root.pergunta1)
	

func _reset_fase():
	# reseted = true
	print('fase resetada')
	araraCharacter._on_reset()	
	$Timer.stop()
	shouldDelay = true
	errouMessagem.visible = false
	acertouMessagem.visible = false
	_configura_baloes()



func _update_vidas():
	if root.vidas == 3:
		vidas.texture = load("res://assets//interface//3vidas.png")
	elif root.vidas == 2:
		vidas.texture = load("res://assets//interface//2vidas.png")
	elif root.vidas == 1:
		vidas.texture = load("res://assets//interface//1vidas.png")
	elif root.vidas == 0:
		vidas.texture = load("res://assets//interface//0vidas.png")


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


func _on_ballon_01_body_entered(body):
	print(body)
	pass  # Replace with function body

func _balao_atingido():
	arara.isMoving = false
	araraCharacter.isMoving = false
	canhao.isMoving = false
	ballon01.is_moving = false
	ballon02.is_moving = false
	ballon03.is_moving = false
	ballon04.is_moving = false
	ballon05.is_moving = false
	ballon06.is_moving = false

func _verificar_acerto(resp: String):
	if resp == respostaCorreta:
		errouMessagem.visible = false
		acertouMessagem.visible = true
		root.fasesDesbloqueadas += 1
		print('fase desbloqueadas',root.fasesDesbloqueadas)
		# if shouldDelay:
		# 	$Timer.start()
		# 	shouldDelay = false
	else:
		errouMessagem.visible = true
		acertouMessagem.visible = false
		root.vidas -= 1
		_update_vidas()
		if shouldDelay:
			$Timer.start()
			shouldDelay = false
	
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
