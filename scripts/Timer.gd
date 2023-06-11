extends Timer

func _ready():
	$Timer.connect("timeout", self, "_on_Timer_timeout")

func _on_Timer_timeout():
	arara.visible = false
	arara.isMoving = false
	araraCharacter.isMoving = false
	baloon01.is_moving = false
	baloon02.is_moving = false
	baloon03.is_moving = false
	baloon04.is_moving = false
	baloon05.is_moving = false
	baloon06.is_moving = false
