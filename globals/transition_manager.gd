extends Node

var transition_manager_scene : PackedScene = preload("res://globals/transition_manager_scene.tscn")

var transition_manager : TransitionManagerScene = null

func _ready() -> void:
    transition_manager = transition_manager_scene.instantiate()
    add_child(transition_manager)

func transition_to_scene(scene: PackedScene) -> void:
    get_tree().paused = true
    transition_manager.animation_player.play("start")
    await transition_manager.animation_player.animation_finished
    get_tree().change_scene_to_packed(scene)
    transition_manager.animation_player.play("end")
    get_tree().paused = false
