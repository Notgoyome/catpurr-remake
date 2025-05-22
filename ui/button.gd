extends Button
@onready var animation_player: AnimationPlayer = $AnimationPlayer

func _on_focus_entered() -> void:
    animation_player.play("up")
    pass # Replace with function body.


func _on_focus_exited() -> void:
    animation_player.play_backwards("up")
    pass # Replace with function body.
