extends Button

var bloqueado = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(_delta):
	if bloqueado:
		self.icon = load("res://assets/levelBloqueada.png")
		self.disabled = true
		
func _pressed():
	self.icon = load("res://assets/levelPressed.png")

