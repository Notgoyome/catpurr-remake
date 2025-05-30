extends Node

signal on_score_changed(new_score: int)
signal player_init(player: Player)

var start_scene = preload("res://scenes/levels/level_1.tscn")
var stop_time_priorty = 0

# stop time priority: 
# 0 - no stop time
# 10 - ingame components
# 20 - pause menu

var current_score : int = 0:
	set(value):
		current_score = value
		on_score_changed.emit(value)

var _current_time: float = 0.0

var current_level: Level
var player: Player :
	set(value):
		player = value
		player_init.emit(value)

var seed_string: String = ""

func init(new_seed = "") -> void:
	if new_seed == "":
		new_seed = str(randi_range(0, 1000000))

	seed(new_seed.hash())
	seed_string = new_seed
	TransitionManager.transition_to_scene(Game.start_scene)
	current_score = 0
	_current_time = Time.get_ticks_msec() / 1000.0
	pass

func init_level(level: Level) -> void:
	current_level = level
	current_score = 0

func stop_time(priority: int = 0) -> void:
	if priority > stop_time_priorty:
		get_tree().paused = true
		stop_time_priorty = priority

func resume_time(priority: int = 0) -> void:
	if priority >= stop_time_priorty:
		get_tree().paused = false
		stop_time_priorty = 0

func get_total_time() -> float:
	return Time.get_ticks_msec() / 1000.0 - _current_time

func get_str_time() -> String:
	var total_time = get_total_time()
	var minutes = int(total_time / 60)
	var seconds = int(total_time) % 60
	return str(minutes) + "m" + str(seconds) + "s"
