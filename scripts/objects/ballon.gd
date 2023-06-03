extends StaticBody2D



@onready var label: Label = $Label;

func _ready():
	add_to_group("balloons")
