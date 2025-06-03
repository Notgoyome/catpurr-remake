@tool
extends ButtonUI
class_name StrippedButton

@onready var dot_animation_player: AnimationPlayer = %DotAnimationPlayer

func _on_focus_entered() -> void:
    super()
    dot_animation_player.play("on_focus_2")


func _on_focus_exited() -> void:
    super()
    dot_animation_player.play("RESET")
    pass # Replace with function body.
