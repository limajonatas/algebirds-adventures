extends Node2D

@onready var sceneActive = false
@onready var reseted = false
@onready var menu: Node2D = get_parent().get_node("MainMenu")
@onready var root: Node2D = get_parent()
@onready var gameOver: Node2D= get_parent().get_node("GameOver")
var musicPlaying = false

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
@onready var errouAlvo: Sprite2D = $MiraErrada
@onready var mira: Line2D = $Mira

@onready var labelPergunta: Label = $Pergunta/Label
# @onready var respostaCorreta:String = root.resposta1
@onready var fase:Sprite2D = $Fase

var balaoAtingido: bool = false

var shouldDelay = true

@onready var baloes = [ballon01, ballon02, ballon03, ballon04, ballon05, ballon06]  # Lista de bal�es dispon�veis
# @onready var baloesAux = [ballon01, ballon02, ballon03, ballon04, ballon05, ballon06] 
@onready var quantidadeDesativar:int = 2;  # Quantidade de bal�es a serem desativados

# @onready var line2D: Line2D = $Line2D
@onready var timerGameOver: Timer = $TimerGameOver
@onready var timer: Timer = $Timer
@onready var fadeIn: AnimationPlayer = $FadeIn
var fadeInExecuted = false

@onready var errorSound:AudioStreamPlayer2D = $ErrorSound
@onready var hitSound:AudioStreamPlayer2D = $HitSound

func _ready():
	errorSound.stop()
	hitSound.stop()
	self.visible = false
	acertouMessagem.visible = false
	errouMessagem.visible = false
	errouAlvo.visible = false
	$TimerErrou.connect("timeout", _reset_fase)
	timer.connect("timeout", _timer)
	timerGameOver.connect("timeout", _game_over)

	if sceneActive and root.musicOn:
		root.music2.play()
		root.music.stop()
	else:
		musicPlaying = false

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
	
	if root.nivelAtual == 1:
		if root.faseAtual == 1:
			for i in range(root.opcoes_nivel1_fase1.size()):
				baloes[i].get_node("Label").set_text(root.opcoes_nivel1_fase1[i])

			labelPergunta.set_text(root.pergunta_nivel1_fase1)

		elif root.faseAtual == 2:
			for i in range(root.opcoes_nivel1_fase2.size()):
				baloes[i].get_node("Label").set_text(root.opcoes_nivel1_fase2[i])

			labelPergunta.set_text(root.pergunta_nivel1_fase2)

		elif root.faseAtual == 3:
			for i in range(root.opcoes_nivel1_fase3.size()):
				baloes[i].get_node("Label").set_text(root.opcoes_nivel1_fase3[i])

			labelPergunta.set_text(root.pergunta_nivel1_fase3)

		elif root.faseAtual == 4:
			for i in range(root.opcoes_nivel1_fase4.size()):
				baloes[i].get_node("Label").set_text(root.opcoes_nivel1_fase4[i])

			labelPergunta.set_text(root.pergunta_nivel1_fase4)


func _timer():
	_reset_fase()
	fadeInExecuted = false
	timer.stop()

func _reset_fase():
	if root.faseAtual == 1:
		fase.texture = load("res://assets//interface//fase1.png")
	elif root.faseAtual == 2:
		fase.texture = load("res://assets//interface//fase2.png")
	elif root.faseAtual == 3:
		fase.texture = load("res://assets//interface//fase3.png")
	elif root.faseAtual == 4:
		fase.texture = load("res://assets//interface//fase4.png")

	araraCharacter._on_reset()	
	arara._reset()
	canhao._reset()

	shouldDelay = true
	errouMessagem.visible = false
	acertouMessagem.visible = false
	errouAlvo.visible = false
	canhao.isMoving = false
	_configura_baloes()
	mira.visible = true
	$TimerErrou.stop()

func _update_vidas():
	if root.vidas == 3:
		vidas.texture = load("res://assets//interface//3vidas.png")
	elif root.vidas == 2:
		vidas.texture = load("res://assets//interface//2vidas.png")
	elif root.vidas == 1:
		vidas.texture = load("res://assets//interface//1vidas.png")
	elif root.vidas == 0:
		vidas.texture = load("res://assets//interface//0vidas.png")
		##chamar tela de game over
		timerGameOver.start()

func _game_over() -> void:
	gameOver.sceneActive = true
	sceneActive = false
	timerGameOver.stop()
	

func _process(_delta) -> void:
	#draw_line(Vector2.ZERO, Vector2.RIGHT * 300, Color.WHITE, 0.8)
	if sceneActive:
		self.visible = true
		if not fadeInExecuted:
			fadeInExecuted = true
			fadeIn.play("fade_in")
		if not musicPlaying and root.musicOn:
			musicPlaying = true
			root.music2.play()
			root.music.stop()
		
		#quando a arara começa a se movimentar
		if arara.isMoving:
			mira.visible = false
	else:
		self.visible = false
		if musicPlaying:
			musicPlaying = false
			root.music2.stop()
			root.music.play()

# func _on_ballon_01_body_entered(body):
# 	pass  # Replace with function body

func _balao_atingido():
	arara.isMoving = false
	arara.activeInput= false
	araraCharacter.activeInput = false
	araraCharacter.isMoving = false
	canhao.isMoving = false
	canhao.activeInput = false

	ballon01.is_moving = false
	ballon02.is_moving = false
	ballon03.is_moving = false
	ballon04.is_moving = false
	ballon05.is_moving = false
	ballon06.is_moving = false

func _verificar_acerto(resp: String):
	if root.nivelAtual == 1:
		if root.faseAtual == 1:
			if resp == root.resposta_nivel1_fase1:
				acertou()
			else:
				errou()
		elif root.faseAtual == 2:
			if resp == root.resposta_nivel1_fase2:
				acertou()
			else:
				errou()
		elif root.faseAtual == 3:
			if resp == root.resposta_nivel1_fase3:
				acertou()
			else:
				errou()
		elif root.faseAtual == 4:
			if resp == root.resposta_nivel1_fase4:
				acertou()
			else:
				errou()
	
	_balao_atingido()


func acertou():
	hitSound.play()
	errouMessagem.visible = false
	acertouMessagem.visible = true
	errouAlvo.visible = false
	root.faseAtual += 1
	timer.start()

func errou():
	errorSound.play()
	errouMessagem.visible = true
	acertouMessagem.visible = false
	errouAlvo.visible = false
	root.vidas -= 1
	_update_vidas()
	if shouldDelay:
		$TimerErrou.start()
		shouldDelay = false

##s�o os sinais emitidos pelos baloes
#as labels ser�o para comparar o que a arara acertou
func _on_ballon_01_atingido(label: String):
	# balaoAtingido = true
	_verificar_acerto(label)

func _on_ballon_02_atingido(label: String):
	# balaoAtingido = true
	_verificar_acerto(label)

func _on_ballon_03_atingido(label: String):
	# balaoAtingido = true
	_verificar_acerto(label)

func _on_ballon_04_atingido(label: String):
	# balaoAtingido = true
	_verificar_acerto(label)

func _on_ballon_05_atingido(label: String):
	# balaoAtingido = true
	_verificar_acerto(label)

func _on_ballon_06_atingido(label: String):
	# balaoAtingido = true
	_verificar_acerto(label)


func _on_arara_azul_saiu_da_tela():
	errouAlvo.visible = true
	root.vidas -= 1
	_update_vidas()
	if shouldDelay:
		$TimerErrou.start()
		shouldDelay = false
		_balao_atingido() ##poderia ter outro nome, mas esta é função necessaria aqui
