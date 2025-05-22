extends Node2D
class_name CaptureComponent

@export var player: Player
@onready var rope: Rope = %Rope

var cd_ready : bool = true

func _ready() -> void:
	rope.player = player
	rope.on_waiting.connect(refresh_cd)

func add_rope(rope: Rope) -> void:
	rope.player = player
	rope.on_waiting.connect(refresh_cd)
	self.add_child(rope)

func can_capture() -> bool:
	return cd_ready

func capture():
	if !cd_ready:
		return false
	cd_ready = false
	rope.change_state(Rope.RopeState.THROWING)
	return true

func refresh_cd():
	cd_ready = true
