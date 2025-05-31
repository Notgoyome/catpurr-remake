extends Node2D
class_name Level

@export var speed_curve: Curve = null
@export var speed = 90.0
var start_time: int = 0
var speed_timer : Timer = null
var speed_i = 1
var stride = 10

func _ready() -> void:
	Game.current_level = self
	start_time = Time.get_ticks_msec()
	speed = speed_curve.sample(1.0)

	speed_timer = Timer.new()
	speed_timer.wait_time = 10
	speed_timer.one_shot = false
	speed_timer.autostart = true
	speed_timer.timeout.connect(_set_new_speed)
	add_child(speed_timer)

	#useful when lauching scene via curreent scene
	if Game.seed_string == "":
		Game.seed_string = "test"
		seed(Game.seed_string.hash())

func _process(delta: float) -> void:
	pass

func _set_new_speed():
	speed = speed_curve.sample(speed_i)
	print("New speed: ", speed)
	speed_i += stride
