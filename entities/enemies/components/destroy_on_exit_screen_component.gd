extends Node2D

@export var min_limit_x: float = -100.0
@export var max_limit_x: float = 500.0

var parent: Node2D
func _ready() -> void:
    parent = get_parent() 

func _process(delta: float) -> void:
    if parent.global_position.x < min_limit_x or parent.global_position.x > max_limit_x:
        parent.queue_free()
        return