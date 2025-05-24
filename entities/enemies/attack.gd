extends State

var player : Player
@export var speed_move : float = 50.0

var enemy: Enemy

var has_attacked: bool = false

func on_entity_ready() -> void:
	enemy = entity as Enemy

func _ready() -> void:
	if Game.player:
		player = Game.player
	else:
		await Game.player_init
	pass

func enter() -> void:
	return

func physics_process(delta) -> void:
	if !has_attacked:
		var direction = enemy.global_position.direction_to(player.global_position)
		enemy.velocity = direction * speed_move
	if !player:
		return
	if enemy.global_position.distance_to(player.global_position) < 8 and not has_attacked:
		player.health_component.damage(1)
		has_attacked = true
		enemy.velocity = Vector2(-1, 0) * speed_move
	enemy.move_and_slide()
