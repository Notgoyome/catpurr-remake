extends Node2D
class_name NumberPop

@onready var label: Label = %Label
@onready var animation_player: AnimationPlayer = %AnimationPlayer
@onready var up: AnimationPlayer = %Up

@export var blink_number: int = 10

func _ready() -> void:
	animation_player.play("enter")
	await animation_player.animation_finished
	up.play("up")
	for i in range(blink_number):
		animation_player.play("blink")
		await animation_player.animation_finished
	if up.is_playing():
		await up.animation_finished
	
	queue_free()
		
func set_number(number: int) -> void:
	%Label.text = str(number)
