extends Node
class_name BlinkComponent

@export var blink_node : Node2D
var blink_timer : Timer = Timer.new()
@export var blink_duration : float = 0.1

var previous_visible : bool = false
var hide_blink_timer : Timer

func _ready() -> void:
    blink_timer.set_wait_time(blink_duration)
    blink_timer.one_shot = true
    blink_timer.timeout.connect(_on_blink_timeout)
    add_child(blink_timer)
    previous_visible = blink_node.visible

func start_blink() -> void:
    previous_visible = blink_node.visible
    blink_timer.start()

func stop_blink() -> void:
    blink_node.visible = true
    blink_timer.stop()
    blink_node.visible = previous_visible

func _on_blink_timeout() -> void:
    blink_node.visible = !blink_node.visible
    blink_timer.start()