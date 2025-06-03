extends Control

@onready var play_button: ButtonUI = %PlayButton

@onready var ui_manager_component: UIManagerComponent = %UiManagerComponent

func _ready() -> void:
	play_button.sound_disabled = true
	ui_manager_component.open_ui(self, play_button)
	play_button.sound_disabled = false
	pass

func _on_play_button_pressed() -> void:
	Game.init()


func _on_quit_button_pressed() -> void:
	get_tree().quit()
