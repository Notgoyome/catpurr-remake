extends CanvasLayer
@export var UiManagerComponent: UIManagerComponent
@onready var button_slider_player: AnimationPlayer = %ButtonSliderPlayer
@onready var resume_button: PauseMenuButton = %ResumeButton

var is_open: bool = false
func _ready() -> void:
	hide()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		print("Pause menu input detected")
		if is_open:
			close()
		else:
			open()
		

func open() -> void:
	if is_open or any_animation_playing():
		return
	is_open = true
	%AnimationPlayer.play("open")
	button_slider_player.play("slide")
	UiManagerComponent.set_ui(self, null, 5, false)
	get_tree().paused = true
	resume_button.sound_disabled = true
	resume_button.grab_focus()
	resume_button.sound_disabled = false

func close() -> void:
	if not is_open or any_animation_playing():
		return
	is_open = false
	%AnimationPlayer.play_backwards("open")
	button_slider_player.play_backwards("slide")

	await %AnimationPlayer.animation_finished
	if button_slider_player.is_playing():
		await button_slider_player.animation_finished
	UiManagerComponent.close_ui()
	get_tree().paused = false

func _on_resume_button_pressed() -> void:
	close()
	pass # Replace with function body.

func any_animation_playing() -> bool:
	return %AnimationPlayer.is_playing() or button_slider_player.is_playing()

func _on_main_menu_button_pressed() -> void:
	Game.go_to_menu()
	pass # Replace with function body.
