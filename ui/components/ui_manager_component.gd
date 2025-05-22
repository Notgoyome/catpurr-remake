extends Node
class_name UIManagerComponent

@export var first_unclosable : bool = false
@export var direction : Vector2 = Vector2(0, 1)
var stack : Array = []
var focus_stack : Array = []
var current_ui : Node = null

func _ready() -> void:
    pass

func _input(event: InputEvent) -> void:
    if event.is_action_pressed("ui_cancel"):
        close_ui()
        return

func set_ui(ui: Node, focus_node: Node = null, hide_current: bool = true) -> void:
    if current_ui != null and hide_current:
        current_ui.hide()

    current_ui = ui
    stack.append(ui)
    ui.show()

    if focus_node != null:
        focus_node.grab_focus()
        focus_stack.append(focus_node)
    else:
        current_ui.grab_focus()
        focus_stack.append(current_ui)
    
func close_ui() -> void:
    if first_unclosable and stack.size() == 1:
        return
    if current_ui != null:
        current_ui.hide()

    if stack.size() > 0:
        var old_ui = stack.pop_back()
        focus_stack.pop_back()
        old_ui.hide()

        if stack.size() >= 1:
            var new_ui = stack.back()
            var current_focus = focus_stack.back()

            new_ui.show()
            current_focus.grab_focus()

