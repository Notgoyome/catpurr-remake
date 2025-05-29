extends State

var rope : Rope
var enemy : Enemy

@export var animation_player : AnimationPlayer
@export var capture_audio : AudioStreamPlayer

func on_entity_ready() -> void:
    enemy = entity as Enemy
    enemy.on_captured.connect(_on_enemy_on_captured)

func enter() -> void:
    if !enemy.enemy_data:
        assert(false, "Enemy has no enemy_data")
        return	
    if !enemy.enemy_data.score:
        assert(false, "Enemy has no score")
        return
    animation_player.play("captured_loop")
    capture_audio.play()
    Game.current_score += enemy.enemy_data.score
    Global.instantiate_number_pop(enemy.enemy_data.score, enemy.global_position - Vector2(0, 8))


func process(delta: float) -> void:
    enemy.global_position = rope.hitbox.global_position

func on_rope_on_waiting() -> void:
    enemy.destroy()
    
func _on_enemy_on_captured(new_rope:Rope) -> void:
    rope = new_rope
    rope.on_waiting.connect(on_rope_on_waiting)

    pass # Replace with function body.
