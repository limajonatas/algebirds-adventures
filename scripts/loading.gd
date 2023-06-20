extends Node2D

@onready var loading: ProgressBar = $ProgressBar
var sceneActive = false
@onready var timer: Timer = $Timer
var inicializou = false
var rng: RandomNumberGenerator
@onready var animation: AnimationPlayer = $AnimationPlayer


func _ready():
	loading.value = 0
	timer.connect("timeout", on_timeout)
	self.visible = false


func _process(_delta):
	if sceneActive and not inicializou:
		self.visible = true
		animation.play("transition")
		inicializou = true
		timer.start()


func on_timeout():
	rng = RandomNumberGenerator.new()
	rng.randomize()

	if loading.value == 100:
		print("Loading complete!")
		timer.stop()
		sceneActive = false
		self.visible = false
	else:
		loading.value += rng.randi_range(10, 30)
		print(loading.value)
