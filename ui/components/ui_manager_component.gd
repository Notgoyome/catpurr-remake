extends Node
class_name UIManagerComponent

@export var first_unclosable : bool = false
@export var direction : Vector2 = Vector2(0, 1)
var stack : Array = []
var focus_stack : Array = []
var current_ui : Node = null
var current_priority : int = 0

#priority :
# 0 - default
# 5 - pause menu
# 10 - game over

var current_unclosable : bool = false

func _ready() -> void:
	pass

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		close_ui()
		return

func set_ui(ui: Node, focus_node: Node = null, priority: int = 0, unclosable: bool = false) -> void:
	if current_priority > priority:
		return

	while stack.size() > 0:
		_force_close()

	open_ui(ui, focus_node, false, unclosable)
	current_priority = priority
	

func open_ui(ui: Node, focus_node: Node = null, hide_current: bool = true, unclosable: bool = false) -> void:
	if current_ui != null and hide_current:
		current_ui.hide()
	current_unclosable = unclosable
	current_ui = ui
	stack.append(ui)
	ui.show()

	if focus_node != null:
		focus_node.grab_focus()
		focus_stack.append(focus_node)

	current_priority = 0

func close_ui() -> bool:
	if first_unclosable and stack.size() == 1:
		return false
	if current_unclosable:
		return false
	if current_ui != null:
		current_ui.hide()

	return _force_close()

func _force_close() -> bool:
	if stack.size() == 0:
		return false
	var old_ui = stack.pop_back()
	focus_stack.pop_back()
	old_ui.hide()

	if stack.size() >= 1:
		var new_ui = stack.back()
		var current_focus = focus_stack.back()

		new_ui.show()
		current_focus.grab_focus()
		return true
	return false
