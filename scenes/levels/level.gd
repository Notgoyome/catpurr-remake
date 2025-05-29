extends Node2D
class_name Level

@export var SPEED = 90.0

func _ready() -> void:
	Game.current_level = self

	#useful when lauching scene via curreent scene
	Game.seed_string = "test"
	seed(Game.seed_string.hash())