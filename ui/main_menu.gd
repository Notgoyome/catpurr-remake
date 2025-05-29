extends Control

@onready var play_button: Button = %PlayButton

@onready var ui_manager_component: UIManagerComponent = %UiManagerComponent

func _ready() -> void:
	ui_manager_component.set_ui(self, play_button)
	pass

func _on_play_button_pressed() -> void:
	Game.init()
	pass # Replace with function body.
