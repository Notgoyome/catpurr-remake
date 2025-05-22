extends Node2D

@export var entity_throw_scene : PackedScene
@export var throw_speed : float = 100.0
@export var direction : Vector2 = Vector2.ZERO

var throw_timer : Timer = Timer.new()
var throw_cooldown : float = 0.5

signal on_throw(throw: Node2D)

func _ready():
    throw_timer.set_wait_time(throw_cooldown)
    throw_timer.one_shot = true
    throw_timer.timeout.connect(on_throw_timeout)
    add_child(throw_timer)

func on_throw_timeout():
    var entity_throw = entity_throw_scene.instantiate()
    entity_throw.position = global_position
    if entity_throw is CharacterBody2D:
        var velocity = direction.normalized() * throw_speed
        entity_throw.velocity = velocity