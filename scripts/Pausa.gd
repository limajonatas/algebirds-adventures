extends Sprite2D

@onready var controlerPause: Control = $CanvasLayer/Control
func _input(event):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		var sprite_global_rect = Rect2(position, texture.get_size() * scale)
		var click_local_pos = to_local(event.position)
		
		if sprite_global_rect.has_point(click_local_pos):
			print('clicou')            
