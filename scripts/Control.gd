extends Control

var a:int = -1

func _process(_delta):
	if Input.is_action_just_pressed('pause'):
		a*=-1
		
	if a==1:
		show()
		get_tree().paused = true
	
	if a==-1:
		hide()
		get_tree().paused = false		


func _on_voltar_voltar():
	a=-1;
