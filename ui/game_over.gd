extends CanvasLayer
class_name GameOver

@export var ui_manager_component : UIManagerComponent

@onready var retry_button: Button = %RetryButton
@onready var animation_player: AnimationPlayer = %AnimationPlayer

@onready var score: TextValueUI = %Score
@onready var time: TextValueUI = %Time
@onready var seed: TextValueUI = %Seed

func _ready() -> void:
	pass

func _on_player_on_player_dying_animation_finished() -> void:
	set_game_data()
	ui_manager_component.set_ui(self, null, 10, true)

	animation_player.play("darken")
	await animation_player.animation_finished

	animation_player.play("pop")
	await animation_player.animation_finished

	retry_button.grab_focus()

func set_game_data() -> void:
	score.set_value(Game.current_score)
	time.set_value(Game.get_str_time())
	seed.set_value(Game.seed_string)


func _on_retry_button_pressed() -> void:
	pass # Replace with function body.


func _on_menu_button_pressed() -> void:
	pass # Replace with function body.
