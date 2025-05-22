extends Node
class_name MovementComponent

var player : Player = null
var player_data : PlayerData = null
var velocity = Vector2(0, 0)
var can_accelerate = true
var can_decelerate = true
var can_move = true
func _ready():
	var parent = get_parent()
	if parent is Player:
		player = parent
		player_data = player.player_data
	else:
		assert(false, "MovementController must be a child of Player")

	
func _process(delta):
	pass

func _physics_process(delta):
	player.velocity = handle_movement(delta, player.velocity)
	player.move_and_slide()



func handle_movement(delta, velocity):
	var new_velocity = Vector2(0, 0)
	var vec = Vector2(0, 0)
	if can_move:
		vec = Input.get_vector("left", "right", "up", "down")
	vec.x = 0
	vec = vec.normalized()

	new_velocity = handle_acceleration_decceleration(delta, vec, velocity)
	return new_velocity

func handle_acceleration_decceleration(delta, vec, velocity):
	var new_velocity = Vector2(0, 0)
	if vec != Vector2(0, 0) and can_accelerate:
		new_velocity = velocity.move_toward(vec * player_data.speed, player_data._acceleration * delta)
	elif can_decelerate:
		new_velocity = velocity.move_toward(Vector2(0, 0), player_data._friction * delta)
	return new_velocity
