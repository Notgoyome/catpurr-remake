
extends Button
class_name ButtonUI

@onready var dot_animation_player: AnimationPlayer = %DotAnimationPlayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var disable_animation: bool = false
@onready var button_label: Label = %ButtonLabel

func _ready() -> void:
    button_label.text = text
    text = ""

func _on_focus_entered() -> void:
    if disable_animation:
        return
    animation_player.play("up")
    dot_animation_player.play("on_focus_2")
    pass # Replace with function body.


func _on_focus_exited() -> void:
    if disable_animation:
        return
    animation_player.play_backwards("up")
    dot_animation_player.play("RESET")
    pass # Replace with function body.
