extends CharacterBody2D
class_name Enemy

@export var enemy_data : EnemyData
@onready var state_machine: StateMachine = $StateMachine
@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D

signal on_destroyed
signal on_captured(rope: Rope)

func _ready() -> void:
	print(name, " ready")

func _process(delta: float) -> void:
	pass

func set_captured(rope: Rope) -> void:
	on_captured.emit(rope)
	state_machine.on_state_transition(state_machine.current_state, "captured")

func destroy() -> void:
	queue_free()
