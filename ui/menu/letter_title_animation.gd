extends TextureRect
class_name Letter

@export var play_every: float = 0.5
@export var off_set: float = 0.1
@onready var letter_animation: AnimationPlayer = $LetterAnimation

var timer: Timer = Timer.new()
func _ready() -> void:
    timer.set_wait_time(off_set)
    timer.one_shot = false
    timer.timeout.connect(on_timeout)
    add_child(timer)
    timer.start()


func on_timeout() -> void:
    timer.wait_time = play_every
    letter_animation.play("default")
    pass
