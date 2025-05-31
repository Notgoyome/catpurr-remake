@tool
extends Button

func _on_pressed() -> void:
	Game.init()
	pass # Replace with function body.


func _on_focus_entered() -> void:
	%AnimationPlayer.play("left")
	pass # Replace with function body.


func _on_focus_exited() -> void:
	%AnimationPlayer.play_backwards("left")
	pass # Replace with function body.
