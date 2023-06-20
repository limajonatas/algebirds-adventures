extends ParallaxBackground

@onready var pai: Node2D = get_parent()
# @onready var textureRect:TextureRect = $ParallaxLayer/TextureRect
# Called when the node enters the scene tree for the first time.
func _ready():
	self.visible = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if pai.sceneActive:
		self.visible = true
	else:
		self.visible = false
