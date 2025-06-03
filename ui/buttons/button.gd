@tool
extends Button
class_name ButtonUI

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@export var disable_animation: bool = false
@onready var button_label: Label = %ButtonLabel
@export var focus_animation: String = ""
@export var hover_animation: String = ""

var sound_disabled: bool = false
@onready var focus_sound: AudioStreamPlayer = %FocusSound

@export_multiline var override_text: String = "Play":
	set(value):
		if %ButtonLabel:
			%ButtonLabel.text = value
		override_text = value
		pass

func _ready() -> void:
	button_label.text = override_text
	override_text = override_text

func _on_focus_entered() -> void:
	if disable_animation:
		return

	if !(sound_disabled):
		focus_sound.play()
	animation_player.play(focus_animation)

func _on_focus_exited() -> void:
	if disable_animation:
		return
	animation_player.play_backwards(focus_animation)
	pass # Replace with function body.
