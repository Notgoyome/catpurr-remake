extends CharacterBody2D

class_name Player

@onready var player_body: Node2D = $PlayerBody
@export var player_data : PlayerData
@onready var rope: Rope = %Rope
@onready var health_component: HealthComponent = $HealthComponent

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Game.player = self
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
