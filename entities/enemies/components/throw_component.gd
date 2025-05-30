extends Node2D

@export var entity_throw_scene : PackedScene
@export var throw_cooldown : float = 0.5
@export var enabled : bool = true
var throw_timer : Timer = Timer.new()

signal on_throw(throw: Node2D)

func _ready():
	throw_timer.set_wait_time(throw_cooldown)
	throw_timer.one_shot = false
	throw_timer.timeout.connect(on_throw_timeout)
	add_child(throw_timer)
	if enabled:
		throw_timer.start()

func on_throw_timeout():
	var entity_throw = entity_throw_scene.instantiate()
	get_tree().current_scene.add_child(entity_throw)
	entity_throw.global_position = global_position

func disable():
	enabled = false
	throw_timer.stop()

func enable():
	enabled = true
	throw_timer.start()
