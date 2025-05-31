extends Node

var current_level: Level
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("refresh_scene"):
		get_tree().reload_current_scene()
	pass

func instantiate_number_pop(number: int, global_position: Vector2) -> void:
	var number_pop = preload("res://entities/visual_effect/number_pop.tscn")
	var number_pop_instance: NumberPop = number_pop.instantiate()
	number_pop_instance.set_number(number)
	number_pop_instance.global_position = global_position
	get_tree().current_scene.add_child(number_pop_instance)