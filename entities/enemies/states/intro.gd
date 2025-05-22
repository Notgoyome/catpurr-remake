extends State

@export var speed_intro : float = 20.0
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
    
func set_random_direction(value: bool) -> void:
    direction.y = -direction.y if randf() > 0.5 else direction.y
    
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
    if next_state_on_limit_reached != "":
        on_limit_reached.connect(change_state)
    if Game.player:
        player = Game.player
    else:
        await Game.player_init

func has_touched_limit() -> bool:
    return enemy.global_position.x <= limit_x


func physics_process(delta: float) -> void:
    if enemy.velocity == Vector2.ZERO:
        enemy.velocity = speed_intro * direction
    else:
        on_limit_reached.emit(enemy)
    print(enemy.velocity)
    var collision = enemy.move_and_collide(enemy.velocity * delta)

    if collision and should_bounce:
        var old_velocity = enemy.velocity
        enemy.velocity = enemy.velocity.bounce(collision.get_normal())
        enemy.velocity.x = old_velocity.x
    
    # if global_position.x - player.global_position.x < 16:
    #     print("Player is close")
    #     state_finished.emit(self, next_state_on_limit_reached)
    
        
    

func change_state(enemy: Enemy) -> void:
    state_finished.emit(self, next_state_on_limit_reached)
