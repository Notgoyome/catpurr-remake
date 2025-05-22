extends CPUParticles2D

func _on_captured_state_finished() -> void:
    emitting = false

func _on_captured_state_enter() -> void:
    emitting = true


func _on_chicken_on_destroyed() -> void:
    hide()
    emitting = false
