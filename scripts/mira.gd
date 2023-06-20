extends Line2D
#............end point x , y ..start point x,  y
var mira1 = [Vector2(772, 135), Vector2(269, 465)]
var mira2 = [Vector2(851, 225), Vector2(275, 476)]
var mira3 = [Vector2(890, 290), Vector2(274, 496)]  #centro #inicial
var mira4 = [Vector2(906, 369), Vector2(274, 514)]
var mira5 = [Vector2(854, 474), Vector2(272, 533)]
var mira6 = [Vector2(876, 556), Vector2(274, 534)]
var miras = [mira1, mira2, mira3, mira4, mira5, mira6]


# Called when the node enters the scene tree for the first time.
func _ready():
	self.default_color = Color(1, 1, 1)
	self.width = 2
	self.antialiased = true

	self.points = miras[2]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass


func _on_gun_cont_updated(value: int):
	if value == 0:
		self.points = miras[2]
	elif value == 1:
		self.points = miras[1]
	elif value == 2:
		self.points = miras[0]
	elif value == -1:
		self.points = miras[3]
	elif value == -2:
		self.points = miras[4]
	elif value == -3:
		self.points = miras[5]
	else:
		self.points = miras[2]
