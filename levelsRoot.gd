extends Node2D

@onready var sceneActive = false
@onready var mensagemAnimation: AnimationPlayer = $AnimationPlayer
var animacaoRodou = false

@onready var level1: Button = $Menu_selection/Level1
@onready var level2: Button = $Menu_selection/Level2
@onready var level3: Button = $Menu_selection/Level3
@onready var level4: Button = $Menu_selection/Level4
@onready var level5: Button = $Menu_selection/Level5
@onready var level6: Button = $Menu_selection/Level6
@onready var level7: Button = $Menu_selection/Level7
@onready var level8: Button = $Menu_selection/Level8
@onready var level9: Button = $Menu_selection/Level9
@onready var level10: Button = $Menu_selection/Level10
@onready var root: Node2D = get_parent()
@onready var menu: Node2D = get_parent().get_node("MainMenu")
@onready var loading: Node2D = get_parent().get_node("Loading")
var faseSelecionada = 0

@onready var jogo: Node2D = get_parent().get_node("Nivel1")

var playingSoundClick = false
@onready var click: AudioStreamPlayer = get_node("Click")


func _ready():
	level1.label.set_text("Lv 1")
	level2.label.set_text("Lv 2")
	level3.label.set_text("Lv 3")
	level4.label.set_text("Lv 4")
	level5.label.set_text("Lv 5")
	level6.label.set_text("Lv 6")
	level7.label.set_text("Lv 7")
	level8.label.set_text("Lv 8")
	level9.label.set_text("Lv 9")
	level10.label.set_text("Lv 10")

	level1.pressed.connect(_level1_Open)
	level2.pressed.connect(_level2_Open)
	level3.pressed.connect(_level3_Open)
	level4.pressed.connect(_level4_Open)
	level5.pressed.connect(_level5_Open)
	level6.pressed.connect(_level6_Open)
	level7.pressed.connect(_level7_Open)
	level8.pressed.connect(_level8_Open)
	level9.pressed.connect(_level9_Open)
	level10.pressed.connect(_level10_Open)


func _level1_Open():
	if sceneActive:
		faseSelecionada = 1
		root.nivelAtual = 1
		_sceneLoading()
	else:
		sceneActive = true


func _level2_Open():
	if sceneActive:
		faseSelecionada = 2
		root.nivelAtual = 2
		_sceneLoading()
	else:
		sceneActive = true


func _level3_Open():
	if sceneActive:
		faseSelecionada = 3
		root.nivelAtual = 3
		_sceneLoading()
	else:
		sceneActive = true


func _level4_Open():
	if sceneActive:
		faseSelecionada = 4
		root.nivelAtual = 4
		_sceneLoading()
	else:
		sceneActive = true


func _level5_Open():
	if sceneActive:
		faseSelecionada = 5
		root.nivelAtual = 5
		_sceneLoading()
	else:
		sceneActive = true


func _level6_Open():
	if sceneActive:
		faseSelecionada = 6
		root.nivelAtual = 6
		_sceneLoading()
	else:
		sceneActive = true


func _level7_Open():
	if sceneActive:
		faseSelecionada = 7
		root.nivelAtual = 7
		_sceneLoading()
	else:
		sceneActive = true


func _level8_Open():
	if sceneActive:
		faseSelecionada = 8
		root.nivelAtual = 8
		_sceneLoading()
	else:
		sceneActive = true


func _level9_Open():
	if sceneActive:
		faseSelecionada = 9
		root.nivelAtual = 9
		_sceneLoading()
	else:
		sceneActive = true


func _level10_Open():
	if sceneActive:
		faseSelecionada = 10
		root.nivelAtual = 10
		_sceneLoading()
	else:
		sceneActive = true


func _sceneLoading():
	root.faseAtual = 1
	jogo._reset_fase()
	sceneActive = false
	animacaoRodou = false
	click.play()
	loading.sceneActive = true


func _process(_delta):
	if sceneActive:
		self.visible = true
		if animacaoRodou == false:
			mensagemAnimation.play("mensagem")
			animacaoRodou = true
		_exibe_mapa_niveis()
		jogo.sceneActive = false
	else:
		self.visible = false

	if loading.loading.value >= 100:
		jogo.sceneActive = true

	if menu.sceneActive == true:
		jogo.sceneActive = false


func _exibe_mapa_niveis():
	if root.fasesDesbloqueadas == 1:
		_desbloquear_fases([level1], [level2, level3, level4, level5, level6, level7, level8, level9, level10])
	elif root.fasesDesbloqueadas == 2:
		_desbloquear_fases([level1, level2], [level3, level4, level5, level6, level7, level8, level9, level10])
	elif root.fasesDesbloqueadas == 3:
		_desbloquear_fases([level1, level2, level3], [level4, level5, level6, level7, level8, level9, level10])
	elif root.fasesDesbloqueadas == 4:
		_desbloquear_fases([level1, level2, level3, level4], [level5, level6, level7, level8, level9, level10])
	elif root.fasesDesbloqueadas == 5:
		_desbloquear_fases([level1, level2, level3, level4, level5], [level6, level7, level8, level9, level10])
	elif root.fasesDesbloqueadas == 6:
		_desbloquear_fases([level1, level2, level3, level4, level5, level6], [level7, level8, level9, level10])
	elif root.fasesDesbloqueadas == 7:
		_desbloquear_fases([level1, level2, level3, level4, level5, level6, level7], [level8, level9, level10])
	elif root.fasesDesbloqueadas == 8:
		_desbloquear_fases([level1, level2, level3, level4, level5, level6, level7, level8], [level9, level10])
	elif root.fasesDesbloqueadas == 9:
		_desbloquear_fases([level1, level2, level3, level4, level5, level6, level7, level8, level9], [level10])
	elif root.fasesDesbloqueadas == 10:
		_desbloquear_fases([level1, level2, level3, level4, level5, level6, level7, level8, level9, level10], [])


func _desbloquear_fases(fases_desbloqueadas, fases_bloqueadas):
	for fase in fases_desbloqueadas:
		fase.texture.disabled = false
		fase.disabled = false
	for fase in fases_bloqueadas:
		fase.texture.disabled = true
		fase.disabled = true
