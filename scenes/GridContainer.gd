extends GridContainer

func _ready():
	for i in range(10):  # Substitua 10 pelo número de sprites que você deseja adicionar
		var sprite = Sprite2D.new()
		# Configurar a textura e outras propriedades do sprite
		add_child(sprite)
