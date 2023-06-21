extends Node2D
@onready var background:TextureRect = $Background/ParallaxLayer/TextureRect
@onready var labelNivel: Label = $Label

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
@onready var fase:Sprite2D = $Fase

var balaoAtingido: bool = false

var shouldDelay = true

@onready var baloes = [ballon01, ballon02, ballon03, ballon04, ballon05, ballon06]  # Lista de bal�es dispon�veis
# @onready var baloesAux = [ballon01, ballon02, ballon03, ballon04, ballon05, ballon06] 
@onready var quantidadeDesativar:int = 2;  # Quantidade de bal�es a serem desativados

# @onready var line2D: Line2D = $Line2D
@onready var timerGameOver: Timer = $TimerGameOver
@onready var timer: Timer = $Timer
@onready var timerNextLevel: Timer = $TimerNextLevel
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
	timerNextLevel.connect("timeout", _next_level)
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
				baloes[i]._set_label_text(root.opcoes_nivel1_fase1[i])

			labelPergunta.set_text(root.pergunta_nivel1_fase1)

		elif root.faseAtual == 2:
			for i in range(root.opcoes_nivel1_fase2.size()):
				baloes[i]._set_label_text(root.opcoes_nivel1_fase2[i])

			labelPergunta.set_text(root.pergunta_nivel1_fase2)

		elif root.faseAtual == 3:
			for i in range(root.opcoes_nivel1_fase3.size()):
				baloes[i]._set_label_text(root.opcoes_nivel1_fase3[i])

			labelPergunta.set_text(root.pergunta_nivel1_fase3)

		elif root.faseAtual == 4:
			for i in range(root.opcoes_nivel1_fase4.size()):
				baloes[i]._set_label_text(root.opcoes_nivel1_fase4[i])

			labelPergunta.set_text(root.pergunta_nivel1_fase4)

	elif root.nivelAtual == 2:
		if root.faseAtual == 1:
			for i in range(root.opcoes_nivel2_fase1.size()):
				baloes[i]._set_label_text(root.opcoes_nivel2_fase1[i])
			labelPergunta.set_text(root.pergunta_nivel2_fase1)
		elif root.faseAtual == 2:
			for i in range(root.opcoes_nivel2_fase2.size()):
				baloes[i]._set_label_text(root.opcoes_nivel2_fase2[i])
			labelPergunta.set_text(root.pergunta_nivel2_fase2)
		elif root.faseAtual == 3:
			for i in range(root.opcoes_nivel2_fase3.size()):
				baloes[i]._set_label_text(root.opcoes_nivel2_fase3[i])
			labelPergunta.set_text(root.pergunta_nivel2_fase3)
		elif root.faseAtual == 4:
			for i in range(root.opcoes_nivel2_fase4.size()):
				baloes[i]._set_label_text(root.opcoes_nivel2_fase4[i])
			labelPergunta.set_text(root.pergunta_nivel2_fase4)

	elif root.nivelAtual == 3:
		if root.faseAtual == 1:
			for i in range(root.opcoes_nivel3_fase1.size()):
				baloes[i]._set_label_text(root.opcoes_nivel3_fase1[i])
			labelPergunta.set_text(root.pergunta_nivel3_fase1)
		elif root.faseAtual == 2:
			for i in range(root.opcoes_nivel3_fase2.size()):
				baloes[i]._set_label_text(root.opcoes_nivel3_fase2[i])
			labelPergunta.set_text(root.pergunta_nivel3_fase2)
		elif root.faseAtual == 3:
			for i in range(root.opcoes_nivel3_fase3.size()):
				baloes[i]._set_label_text(root.opcoes_nivel3_fase3[i])
			labelPergunta.set_text(root.pergunta_nivel3_fase3)
		elif root.faseAtual == 4:
			for i in range(root.opcoes_nivel3_fase4.size()):
				baloes[i]._set_label_text(root.opcoes_nivel3_fase4[i])
			labelPergunta.set_text(root.pergunta_nivel3_fase4)

	elif root.nivelAtual == 4:
		if root.faseAtual == 1:
			for i in range(root.opcoes_nivel4_fase1.size()):
				baloes[i]._set_label_text(root.opcoes_nivel4_fase1[i])
			labelPergunta.set_text(root.pergunta_nivel4_fase1)
		elif root.faseAtual == 2:
			for i in range(root.opcoes_nivel4_fase2.size()):
				baloes[i]._set_label_text(root.opcoes_nivel4_fase2[i])
			labelPergunta.set_text(root.pergunta_nivel4_fase2)
		elif root.faseAtual == 3:
			for i in range(root.opcoes_nivel4_fase3.size()):
				baloes[i]._set_label_text(root.opcoes_nivel4_fase3[i])
			labelPergunta.set_text(root.pergunta_nivel4_fase3)
		elif root.faseAtual == 4:
			for i in range(root.opcoes_nivel4_fase4.size()):
				baloes[i]._set_label_text(root.opcoes_nivel4_fase4[i])
			labelPergunta.set_text(root.pergunta_nivel4_fase4)

	elif root.nivelAtual == 5:
		if root.faseAtual == 1:
			for i in range(root.opcoes_nivel5_fase1.size()):
				baloes[i]._set_label_text(root.opcoes_nivel5_fase1[i])
			labelPergunta.set_text(root.pergunta_nivel5_fase1)
		elif root.faseAtual == 2:
			for i in range(root.opcoes_nivel5_fase2.size()):
				baloes[i]._set_label_text(root.opcoes_nivel5_fase2[i])
			labelPergunta.set_text(root.pergunta_nivel5_fase2)
		elif root.faseAtual == 3:
			for i in range(root.opcoes_nivel5_fase3.size()):
				baloes[i]._set_label_text(root.opcoes_nivel5_fase3[i])
			labelPergunta.set_text(root.pergunta_nivel5_fase3)
		elif root.faseAtual == 4:
			for i in range(root.opcoes_nivel5_fase4.size()):
				baloes[i]._set_label_text(root.opcoes_nivel5_fase4[i])
			labelPergunta.set_text(root.pergunta_nivel5_fase4)
	



func _timer():
	_reset_fase()
	fadeInExecuted = false
	timer.stop()

func _charge_background():
	if root.nivelAtual == 1:
		labelNivel.set_text("Nível 1")
		background.texture = load("res://assets//background//background1.png")
	elif root.nivelAtual == 2:
		labelNivel.set_text("Nível 2")
		background.texture = load("res://assets//background//background2.jpeg")
	elif root.nivelAtual == 3:
		labelNivel.set_text("Nível 3")
		background.texture = load("res://assets//background//background3.jpeg")
	elif root.nivelAtual == 4:
		labelNivel.set_text("Nível 4")
		background.texture = load("res://assets//background//background4.jpeg")
	elif root.nivelAtual == 5:
		labelNivel.set_text("Nível 5")
		background.texture = load("res://assets//background//background5.jpeg")
	elif root.nivelAtual == 6:
		labelNivel.set_text("Nível 6")
		background.texture = load("res://assets//background//background6.jpeg")
	elif root.nivelAtual == 7:
		labelNivel.set_text("Nível 7")
		background.texture= load("res://assets//background//background7.jpeg")
	elif root.nivelAtual == 8:
		labelNivel.set_text("Nível 8")
		background.texture = load("res://assets//background//background8.jpeg")

func _charge_fase_interface():
	if root.faseAtual == 1:
		fase.texture = load("res://assets//interface//fase1.png")
	elif root.faseAtual == 2:
		fase.texture = load("res://assets//interface//fase2.png")
	elif root.faseAtual == 3:
		fase.texture = load("res://assets//interface//fase3.png")
	elif root.faseAtual == 4:
		fase.texture = load("res://assets//interface//fase4.png")

func _reset_fase():
	_charge_fase_interface()
	_charge_background()
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
	elif root.nivelAtual == 2:
		if root.faseAtual == 1:
			if resp == root.resposta_nivel2_fase1:
				acertou()
			else:
				errou()
		elif root.faseAtual == 2:
			if resp == root.resposta_nivel2_fase2:
				acertou()
			else:
				errou()
		elif root.faseAtual == 3:
			if resp == root.resposta_nivel2_fase3:
				acertou()
			else:
				errou()
		elif root.faseAtual == 4:
			if resp == root.resposta_nivel2_fase4:
				acertou()
			else:
				errou()
	elif root.nivelAtual == 3:
		if root.faseAtual == 1:
			if resp == root.resposta_nivel3_fase1:
				acertou()
			else:
				errou()
		elif root.faseAtual == 2:
			if resp == root.resposta_nivel3_fase2:
				acertou()
			else:
				errou()
		elif root.faseAtual == 3:
			if resp == root.resposta_nivel3_fase3:
				acertou()
			else:
				errou()
		elif root.faseAtual == 4:
			if resp == root.resposta_nivel3_fase4:
				acertou()
			else:
				errou()


	_balao_atingido()

func _save_in_data():
	var file = FileAccess.open("res://data/data.lvs.aa", FileAccess.WRITE)
	file.store_string(str(root.fasesDesbloqueadas))

##é usado no timerNextLevel
func _next_level():
	root.nivelAtual += 1
	root.fasesDesbloqueadas += 1
	root.faseAtual = 1
	root.vidas = 3
	_save_in_data()
	_update_vidas()
	_charge_background()
	_reset_fase()
	fadeInExecuted = false
	timerNextLevel.stop()

func acertou():
	hitSound.play()
	errouMessagem.visible = false
	acertouMessagem.visible = true
	errouAlvo.visible = false
	if root.faseAtual== 4:
		timerNextLevel.start()
	else:
		root.faseAtual += 1
		#muda de fase
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
	_verificar_acerto(label)

func _on_ballon_02_atingido(label: String):
	_verificar_acerto(label)

func _on_ballon_03_atingido(label: String):
	_verificar_acerto(label)

func _on_ballon_04_atingido(label: String):
	_verificar_acerto(label)

func _on_ballon_05_atingido(label: String):
	_verificar_acerto(label)

func _on_ballon_06_atingido(label: String):
	_verificar_acerto(label)


func _on_arara_azul_saiu_da_tela():
	errouAlvo.visible = true
	root.vidas -= 1
	_update_vidas()
	if shouldDelay:
		$TimerErrou.start()
		shouldDelay = false
		_balao_atingido() ##poderia ter outro nome, mas esta é função necessaria aqui
