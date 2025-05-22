extends Control

@onready var play_button: Button = %PlayButton

@onready var ui_manager_component: UIManagerComponent = %UiManagerComponent

@export var start_scene: PackedScene

func _ready() -> void:
	ui_manager_component.set_ui(self, play_button)
	pass


func _on_play_button_pressed() -> void:
	TransitionManager.transition_to_scene(start_scene)
	pass # Replace with function body.
