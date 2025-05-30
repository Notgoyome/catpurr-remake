extends Button
class_name UpButton

func _on_focus_entered() -> void:
    %AnimationPlayer.play("Up")
    pass # Replace with function body.


func _on_focus_exited() -> void:
    %AnimationPlayer.play_backwards("Up")
    pass # Replace with function body.



func _on_mouse_exited() -> void:
    _on_focus_exited()
    pass # Replace with function body.

func _on_mouse_entered() -> void:
    _on_focus_entered()
    pass # Replace with function body.
