extends RichTextLabel


@export var score_string: String = ""
var score : int = 0 :
	set(value):
		score = value
		_set_score(value)

func _ready() -> void:
	score = Game.current_score
	Game.on_score_changed.connect(change_score)

func _set_score(value: int) -> void:
	text = score_string + str(value)

func change_score(value: int) -> void:
	var tween = get_tree().create_tween()
	tween.tween_property(self, "score", value, 1.25).set_trans(Tween.TRANS_QUINT).set_ease(Tween.EASE_OUT)
	tween.play()
