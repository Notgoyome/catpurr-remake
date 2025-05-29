extends TileMapLayer

@export var level : Level
var screen_x : int = 0
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	screen_x = get_viewport_rect().size.x
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= level.speed * delta
	if global_position.x <= -screen_x:
		global_position.x += screen_x * 2
	pass
