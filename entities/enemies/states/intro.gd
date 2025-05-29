extends State
class_name IntroState

@export var speed_intro : float = 20.0
@export var local_speed : bool = false
@export var limit_x : int = -120
@export var direction : Vector2 = Vector2(-1, 0.5)
@export var next_state_on_limit_reached : String = ""
@export var should_bounce : bool = true
signal on_limit_reached(enemy: Enemy)

var enemy : Enemy
var player : Player
var col_normal : Vector2 = Vector2.ZERO

func on_entity_ready() -> void:
	enemy = entity as Enemy
	
func set_random_direction() -> void:
	direction.y = -direction.y if randf() > 0.5 else direction.y
	
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if next_state_on_limit_reached != "":
		on_limit_reached.connect(change_state)
	if Game.player:
		player = Game.player
	else:
		await Game.player_init

func physics_process(delta: float) -> void:
	if enemy.velocity == Vector2.ZERO:
		enemy.velocity = speed_intro * direction
		if local_speed:
			enemy.velocity += Game.current_level.speed * Vector2(-1, 0)
	var collision = enemy.move_and_collide(enemy.velocity * delta)

	if collision and should_bounce:
		var old_velocity = enemy.velocity
		enemy.velocity = enemy.velocity.bounce(collision.get_normal())
		enemy.velocity.x = old_velocity.x
	
	if global_position.x < 8:
		state_finished.emit(self, next_state_on_limit_reached)
	
func change_state(enemy: Enemy) -> void:
	state_finished.emit(self, next_state_on_limit_reached)
