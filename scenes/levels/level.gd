extends Node2D
class_name Level

@export var speed_curve: Curve = null
@export var speed = 90.0
var start_time: int = 0
var i: int = 0
func _ready() -> void:
    Game.current_level = self
    start_time = Time.get_ticks_msec()
    speed = speed_curve.sample(0.0)
    #useful when lauching scene via curreent scene
    Game.seed_string = "test"
    seed(Game.seed_string.hash())

func _process(delta: float) -> void:
    if i < 60:
        i += 1
        return
    i = 0
    var current_time : int = Time.get_ticks_msec() - start_time
    print(current_time / 1000.0)
    speed = speed_curve.sample(current_time / 1000.0)
    print(speed)