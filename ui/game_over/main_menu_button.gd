extends ButtonUI
class_name MainMenuButton

var main_menu_scene: PackedScene = load("res://ui/main_menu.tscn")

func _on_pressed() -> void:
    TransitionManager.transition_to_scene(main_menu_scene)
    pass # Replace with function body.

