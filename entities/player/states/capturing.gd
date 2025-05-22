extends State

@export var movement_component: MovementComponent
var is_current_state: bool = false

func enter() -> void:
    is_current_state = true
    movement_component.can_move = false
    pass

func exit() -> void:
    is_current_state = false
    pass

func _on_rope_on_returning() -> void:
    return
    if is_current_state:
        state_finished.emit(self, "Normal")


func _on_rope_on_waiting() -> void:
    if is_current_state:
        state_finished.emit(self, "Normal")
