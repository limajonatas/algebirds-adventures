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

@onready var fase1_level1: Node2D = get_parent().get_node("Nivel1")


func _ready():
	if root.fasesDesbloqueadas == 1:
		level1.disabled = false
		level2.disabled = true
		level3.disabled = true
		level4.disabled = true
		level5.disabled = true
		level6.disabled = true
		level7.disabled = true
		level8.disabled = true
	elif root.fasesDesbloqueadas == 2:
		level1.disabled = false
		level2.disabled = false
		level3.disabled = true
		level4.disabled = true
		level5.disabled = true
		level6.disabled = true
		level7.disabled = true
		level8.disabled = true
	elif root.fasesDesbloqueadas == 3:
		level1.disabled = false
		level2.disabled = false
		level3.disabled = false
		level4.disabled = true
		level5.disabled = true
		level6.disabled = true
		level7.disabled = true
		level8.disabled = true
	elif root.fasesDesbloqueadas == 4:
		level1.disabled = false
		level2.disabled = false
		level3.disabled = false
		level4.disabled = false
		level5.disabled = true
		level6.disabled = true
		level7.disabled = true
		level8.disabled = true
	elif root.fasesDesbloqueadas == 5:
		level1.disabled = false
		level2.disabled = false
		level3.disabled = false
		level4.disabled = false
		level5.disabled = false
		level6.disabled = true
		level7.disabled = true
		level8.disabled = true
	elif root.fasesDesbloqueadas == 6:
		level1.disabled = false
		level2.disabled = false
		level3.disabled = false
		level4.disabled = false
		level5.disabled = false
		level6.disabled = false
		level7.disabled = true
		level8.disabled = true
	elif root.fasesDesbloqueadas == 7:
		level1.disabled = false
		level2.disabled = false
		level3.disabled = false
		level4.disabled = false
		level5.disabled = false
		level6.disabled = false
		level7.disabled = false
		level8.disabled = true
	elif root.fasesDesbloqueadas == 8:
		level1.disabled = false
		level2.disabled = false
		level3.disabled = false
		level4.disabled = false
		level5.disabled = false
		level6.disabled = false
		level7.disabled = false
		level8.disabled = false

	level1.pressed.connect(_level1_Open)


func _level1_Open():
	if sceneActive:
		sceneActive = false
		fase1_level1.sceneActive = true
	else:
		sceneActive = true
		


func _process(_delta):
	if sceneActive:
		self.visible = true
	else:
		self.visible = false
