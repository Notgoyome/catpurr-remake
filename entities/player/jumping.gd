extends State

var player: Player

var current_mask: int = 0
@export var animation_player: AnimationPlayer

func on_entity_ready() -> void:
    player = entity as Player
    pass

func enter() -> void:
    var current_z_index: int = player.z_index
    player.z_index = z_index + 1

    animation_player.play("jump")

    player.set_collision_layer_value(2 , false)
    await animation_player.animation_finished
    
    state_finished.emit(self, "normal")
    player.z_index = current_z_index
    player.set_collision_layer_value(2 , true)
    pass

func exit() -> void:
    pass