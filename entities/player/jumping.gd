extends State

var player: Player

var current_mask: int = 0
@export var animation_player: AnimationPlayer

func on_entity_ready() -> void:
    player = entity as Player
    pass

func enter() -> void:
    current_mask = player.get_collision_mask()
    animation_player.play("jump")
    await animation_player.animation_finished
    state_finished.emit(self, "normal")
    pass

func exit() -> void:
    player.set_collision_mask(current_mask)
    pass