extends Node2D

#Aqui serve para alterar a movimentação dos balões
@onready var ballon01: Area2D = $Ballon01
@onready var ballon02: Area2D = $Ballon02
@onready var ballon03: Area2D = $Ballon03
@onready var ballon04: Area2D = $Ballon04
@onready var ballon05: Area2D = $Ballon05
@onready var ballon06: Area2D = $Ballon06

@onready var label: Label = $Ballon01/Label
@onready var arara: CharacterBody2D = $AraraAzul

@onready var pergunta: Label = $Pergunta/Label
 
var balaoAtingido: bool = false;

var startPosition: Vector2 = Vector2(100, 100)
var targetPosition: Vector2 = Vector2(200, 200)


@onready var line2D: Line2D = $Line2D



func _ready():
	# Modificar as propriedades do Line2D
	line2D.default_color = Color(1, 1, 1)
	line2D.width = 2
	line2D.antialiased = true


	var positionAX=line2D.get_point_position(0).x;
	var positionAY=line2D.get_point_position(0).y;
	var positionBX=line2D.get_point_position(1).x
	var positionBY=line2D.get_point_position(1).y;

	# Definir os pontos de controle iniciais
	var startPoint = Vector2(positionAX, positionAY)
	var endPoint = Vector2(positionBX, positionBY)
	line2D.points = [startPoint, endPoint]
	
	
	# Definir o texto inicial
	label.set_text("")
	pergunta.set_text('2/2')
	# Ou você pode definir o texto usando uma variável
	var texto = "2*2"
	label.set_text(texto)
	

func _process(_delta) -> void:
	#draw_line(Vector2.ZERO, Vector2.RIGHT * 300, Color.WHITE, 0.8)
	
	if(balaoAtingido):
		arara.visible = false;
		arara.isMoving =false;
		ballon01.is_moving = false
		ballon02.is_moving = false
		ballon03.is_moving = false
		ballon04.is_moving = false
		ballon05.is_moving = false
		ballon06.is_moving = false
	

func _on_ballon_01_body_entered(body):
	print(body)
	pass # Replace with function body

##são os sinais emitidos pelos baloes
#as labels serão para comparar o que a arara acertou
func _on_ballon_01_atingido(value:bool, lab: Label ):
	print(value, lab.text)
	balaoAtingido = true;

func _on_ballon_02_atingido(value, lab: Label ):
	print(value, lab.text)
	balaoAtingido = true;

func _on_ballon_03_atingido(value, lab: Label ):
	print(value, lab.text)
	balaoAtingido = true;

func _on_ballon_04_atingido(value, lab: Label ):
	print(value, lab.text)
	balaoAtingido = true;

func _on_ballon_05_atingido(value, lab: Label ):
	print(value, lab.text)
	balaoAtingido = true;

func _on_ballon_06_atingido(value, lab: Label ):
	print(value, lab.text)
	balaoAtingido = true;

