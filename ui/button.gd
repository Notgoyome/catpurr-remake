@tool
extends Button
class_name ButtonUI

@onready var dot_animation_player: AnimationPlayer = %DotAnimationPlayer
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var disable_animation: bool = false
@onready var button_label: Label = %ButtonLabel
@export var focus_animation: String = "left"
@export var hover_animation: String = "left"

@export_multiline var override_text: String = "Play":
    set(value):
        %ButtonLabel.text = value
        override_text = value
        # text = " " if value != "" else ""
        pass

func _ready() -> void:
    override_text = override_text

func _on_focus_entered() -> void:
    if disable_animation:
        return
    animation_player.play(focus_animation)
    dot_animation_player.play("on_focus_2")
    pass # Replace with function body.


func _on_focus_exited() -> void:
    if disable_animation:
        return
    animation_player.play_backwards(focus_animation)
    dot_animation_player.play("RESET")
    pass # Replace with function body.
