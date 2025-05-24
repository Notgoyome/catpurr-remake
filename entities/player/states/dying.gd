extends State

@export var player_animation: AnimationPlayer

var player: Player

func on_entity_ready() -> void:
    player = entity as Player

func enter():
    player_animation.play("sleep")
    await get_tree().create_timer(0.5).timeout
    player.on_player_dying_animation_finished.emit()

func physics_process(delta: float) -> void:
    player.velocity = Game.current_level.SPEED * Vector2(-1, 0)
    player.move_and_slide()
    pass