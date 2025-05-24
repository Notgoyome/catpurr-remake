extends Node

@export var direction: Vector2 = Vector2(-1, 0)
@export var bullet: Bullet

var speed: float = 0.0

func _ready() -> void:
	speed = bullet.bullet_data.speed

func _process(delta: float) -> void:
	bullet.global_position += direction * speed * delta
