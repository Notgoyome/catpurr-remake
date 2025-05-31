extends Node
class_name Spawner

@export var waves : Array[WaveData]
@export var wave_probability : Array[float]
@export var spawn_delay : Curve
@export var delay_additional_random_percentage : float = 0.2
@export var debug_only_i_wave : int = -1
var start_time : float = 0.0
var delay_timer : Timer = null

var delay_index_timer : Timer = null
var delay_index : int = 1
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	start_time = Time.get_ticks_msec()

	delay_timer = Timer.new()
	delay_timer.wait_time = get_delay_time()
	delay_timer.one_shot = true
	delay_timer.timeout.connect(spawn_wave)
	add_child(delay_timer)
	delay_timer.start()

	delay_index_timer = Timer.new()
	delay_index_timer.wait_time = 1.0
	delay_index_timer.one_shot = false
	delay_index_timer.autostart = true
	delay_index_timer.timeout.connect(set_delay_time)
	add_child(delay_index_timer)
	
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func spawn_wave():
	var wave : WaveData = waves[randi() % waves.size()]

	if debug_only_i_wave >= 0 and debug_only_i_wave < waves.size():
		wave = waves[debug_only_i_wave]

	var wave_instance : Node2D = wave.scene.instantiate()
	wave_instance.position = Vector2(wave.x_start, randf_range(wave.min_y, wave.max_y))

	add_child(wave_instance)
	
	delay_timer.wait_time = get_delay_time() + wave.additional_delay
	delay_timer.start()


func get_delay_time() -> float:
	var delay : float = spawn_delay.sample(delay_index)
	
	var random_sign = 1 if randf() > 0.5 else -1
	var new_delay =  delay + (delay * delay_additional_random_percentage * random_sign)
	new_delay = max(new_delay, 0.1)
	return new_delay

func set_delay_time() -> void:
	delay_index += 1