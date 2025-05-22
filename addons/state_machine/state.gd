extends Node2D

class_name State

var entity : Node
signal state_finished
signal state_enter

func on_entity_ready() -> void:
	pass

func enter() -> void:
	pass

func process(delta: float) -> void:
	pass

func physics_process(delta: float) -> void:
	pass

func exit() -> void:
	pass