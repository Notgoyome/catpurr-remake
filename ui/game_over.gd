extends CanvasLayer
class_name GameOver
@onready var retry_button: ButtonUI = %RetryButton
@onready var animation_player: AnimationPlayer = %AnimationPlayer
func _ready() -> void:
    hide()

func _on_player_on_player_dying_animation_finished() -> void:
    show()
    animation_player.play("pop")
    await animation_player.animation_finished
    retry_button.grab_focus()
    pass # Replace with function body.
