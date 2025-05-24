extends Node

var transition_manager_scene : PackedScene = preload("res://globals/transition_manager_scene.tscn")

var transition_manager : TransitionManagerScene = null
var timer : Timer = null
func _ready() -> void:
	timer = Timer.new()
	timer.process_mode = Node.PROCESS_MODE_ALWAYS
	timer.wait_time = 0.5
	add_child(timer)
	timer.one_shot = true
	transition_manager = transition_manager_scene.instantiate()
	add_child(transition_manager)

func transition_to_scene(scene: PackedScene) -> void:
	get_tree().paused = true
	transition_manager.animation_player.play("start")
	timer.start()
	await transition_manager.animation_player.animation_finished
	get_tree().change_scene_to_packed(scene)
	if !timer.is_stopped():
		await timer.timeout
	await get_tree().process_frame
	
	transition_manager.animation_player.play("end")
	get_tree().paused = false
