@tool
extends ButtonUI
class_name PauseMenuButton
@export var unselect_color = Color("#333941")
@export var select_color = Color("#d6f264")

var sound_disabled: bool = false
@onready var focus_sound: AudioStreamPlayer = %FocusSound

func _ready() -> void:
	set_color(unselect_color)

func _on_focus_entered() -> void:
	%AnimationPlayer.play("left")
	if !(sound_disabled):
		focus_sound.play()
	set_color(select_color)

func _on_focus_exited() -> void:
	%AnimationPlayer.play_backwards("left")
	set_color(unselect_color)

func set_color(color: Color) -> void:
	material.set("shader_parameter/to_color", color)


func _on_mouse_exited() -> void:
	# _on_focus_exited()
	pass # Replace with function body.

func _on_mouse_entered() -> void:
	# _on_focus_entered()
	pass # Replace with function body.
