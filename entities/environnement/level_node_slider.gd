extends Node2D

@export var spawn_x_min : int = 320
@export var spawn_x_max : int = 640
@export var limit_x : int = 0
@export var speed : int = 20
@export var direction : int = -1

func _ready() -> void:
    pass

func get_random_spawn_x() -> int:
    return randi() % (spawn_x_max - spawn_x_min) + spawn_x_min

func _process(delta: float) -> void:
    global_position.x += speed * direction * delta
    if global_position.x < limit_x and direction == -1:
        var gap : float = limit_x - global_position.x
        global_position.x = get_random_spawn_x() + gap
    elif global_position.x > limit_x and direction == 1:
        var gap : float = global_position.x - limit_x
        global_position.x = get_random_spawn_x() - gap