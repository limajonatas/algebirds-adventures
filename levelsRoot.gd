extends Node2D

@onready var sceneActive = false
@onready var level1: Button = $Menu_selection/Level1
@onready var level2: Button = $Menu_selection/Level2
@onready var level3: Button = $Menu_selection/Level3
@onready var level4: Button = $Menu_selection/Level4
@onready var level5: Button = $Menu_selection/Level5
@onready var level6: Button = $Menu_selection/Level6
@onready var level7: Button = $Menu_selection/Level7
@onready var level8: Button = $Menu_selection/Level8
@onready var root: Node2D = get_parent()
@onready var menu: Node2D = get_parent().get_node("MainMenu")
@onready var loading: Node2D = get_parent().get_node("Loading")
var faseSelecionada = 0

@onready var fase1_level1: Node2D = get_parent().get_node("Nivel1")

var playingSoundClick=false
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

	level1.pressed.connect(_level1_Open)

func _level1_Open():
	if sceneActive:
		faseSelecionada = 1
		sceneActive = false
		# fase1_level1.sceneActive = true
		click.play()
		loading.sceneActive = true
	else:
		sceneActive = true


func _process(_delta):
	if sceneActive:
		self.visible = true
		_exibe_mapa_niveis()
		fase1_level1.sceneActive = false
	else:
		self.visible = false
	if loading.loading.value >= 100:
		if faseSelecionada == 1:
			fase1_level1.sceneActive = true
		else:
			sceneActive = true
	
	if menu.sceneActive == true:
		fase1_level1.sceneActive = false

func _exibe_mapa_niveis():
	if root.nivelAtual == 1:
		level1.texture.disabled = false
		level2.texture.disabled = true
		level3.texture.disabled = true
		level4.texture.disabled = true
		level5.texture.disabled = true
		level6.texture.disabled = true
		level7.texture.disabled = true
		level8.texture.disabled = true
	elif root.nivelAtual == 2:
		level1.texture.disabled = false
		level2.texture.disabled = false
		level3.texture.disabled = true
		level4.texture.disabled = true
		level5.texture.disabled = true
		level6.texture.disabled = true
		level7.texture.disabled = true
		level8.texture.disabled = true
	elif root.nivelAtual == 3:
		level1.texture.disabled = false
		level2.texture.disabled = false
		level3.texture.disabled = false
		level4.texture.disabled = true
		level5.texture.disabled = true
		level6.texture.disabled = true
		level7.texture.disabled = true
		level8.texture.disabled = true
	elif root.nivelAtual == 4:
		level1.texture.disabled = false
		level2.texture.disabled = false
		level3.texture.disabled = false
		level4.texture.disabled = false
		level5.texture.disabled = true
		level6.texture.disabled = true
		level7.texture.disabled = true
		level8.texture.disabled = true
	elif root.nivelAtual == 5:
		level1.texture.disabled = false
		level2.texture.disabled = false
		level3.texture.disabled = false
		level4.texture.disabled = false
		level5.texture.disabled = false
		level6.texture.disabled = true
		level7.texture.disabled = true
		level8.texture.disabled = true
	elif root.nivelAtual == 6:
		level1.texture.disabled = false
		level2.texture.disabled = false
		level3.texture.disabled = false
		level4.texture.disabled = false
		level5.texture.disabled = false
		level6.texture.disabled = false
		level7.texture.disabled = true
		level8.texture.disabled = true
	elif root.nivelAtual == 7:
		level1.texture.disabled = false
		level2.texture.disabled = false
		level3.texture.disabled = false
		level4.texture.disabled = false
		level5.texture.disabled = false
		level6.texture.disabled = false
		level7.texture.disabled = false
		level8.texture.disabled = true
	elif root.nivelAtual == 8:
		level1.texture.disabled = false
		level2.texture.disabled = false
		level3.texture.disabled = false
		level4.texture.disabled = false
		level5.texture.disabled = false
		level6.texture.disabled = false
		level7.texture.disabled = false
		level8.texture.disabled = false
