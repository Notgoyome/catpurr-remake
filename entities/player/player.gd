extends CharacterBody2D

class_name Player

@onready var player_body: Node2D = $PlayerBody
@export var player_data : PlayerData
@onready var rope: Rope = %Rope
@onready var health_component: HealthComponent = $HealthComponent
@onready var state_machine: StateMachine = %StateMachine

signal on_player_dying_animation_finished

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.player = self
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_health_component_on_death() -> void:
	state_machine.on_state_transition(state_machine.current_state, "dying")
	pass # Replace with function body.


func _on_jumping_state_enter() -> void:
	pass # Replace with function body.
