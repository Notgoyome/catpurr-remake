extends Timer

@export var priority: int = 10

func _ready() -> void:
    timeout.connect(_stop_stop_time)

func start_stop_time() -> void:
    print("Stopping time with priority: ", priority)
    Game.stop_time(priority)
    start()

func _stop_stop_time() -> void:
    Game.resume_time(priority)
    stop()


func _on_health_component_on_damage() -> void:
    print("azeraz")
    pass # Replace with function body.
