extends BoxContainer
class_name TextValueUI
@onready var valueUI: Label = %Value
@onready var textUI: Label = %Text
func set_text_value(text: String, value: Variant) -> void:
	textUI.text = text
	set_value(value)

func set_value(value: Variant) -> void:
	valueUI.text = str(value)
