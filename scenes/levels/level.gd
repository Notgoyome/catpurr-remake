extends Node2D
class_name Level

@export var SPEED = 90.0

func _ready() -> void:
	Game.current_level = self