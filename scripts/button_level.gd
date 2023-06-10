extends Button


func _ready():
	self.icon = load("res://assets/level.png")


func _process(_delta):
	if self.disabled:
		self.icon = load("res://assets/levelBloqueada.png")
	else:
		self.icon = load("res://assets/level.png")
