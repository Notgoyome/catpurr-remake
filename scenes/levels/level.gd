extends Node2D
class_name Level

@export var SPEED = 90.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.current_level = self
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
