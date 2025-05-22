extends Node2D
class_name Rope

enum RopeState {
	WAITING,
	THROWING,
	RETURNING_PAUSED,
	RETURNING,
}
@onready var rope: NinePatchRect = %Rope
@onready var hitbox: Area2D = %Hitbox
var init_hitbox_mask: int = 0
var start_hitbox_position: Vector2 = Vector2.ZERO

var player: Player = null
var rope_state: RopeState = RopeState.WAITING
var loop_tween: Tween = null
var rope_tween: Tween = null
var cord
signal on_waiting
signal on_throwing
signal on_returning


func _ready():
	start_hitbox_position = hitbox.position
	init_hitbox_mask = hitbox.collision_mask
	hitbox.collision_mask = 0

func _process(delta: float) -> void:
	match rope_state:
		RopeState.WAITING:
			pass


func change_state(new_state: RopeState) -> void:
	rope_state = new_state

	match new_state:
		RopeState.WAITING:
			on_waiting.emit()
			enter_waiting()
		RopeState.THROWING:
			on_throwing.emit()
			enter_throwing()
		RopeState.RETURNING:
			on_returning.emit()
			enter_returning()
		RopeState.RETURNING_PAUSED:
			on_returning.emit()
			enter_returning(true)

func _on_hitbox_body_entered(body:Node2D) -> void:
	if body is not Enemy:
		return
	body.set_captured(self) 
	stop_all_tweens()
	change_state(RopeState.RETURNING_PAUSED)
	pass # Replace with function body.


func enter_waiting() -> void:
	pass

func enter_returning(waiting: bool = false) -> void:
	hitbox.collision_mask = 0
	stop_all_tweens()
	if waiting:
		await get_tree().create_timer(player.player_data.rope_capture_wait_time).timeout

	loop_tween = get_tree().create_tween()
	rope_tween = get_tree().create_tween()
	var time = hitbox.position.distance_to(start_hitbox_position) / player.player_data.rope_recover_speed
	loop_tween.tween_property(hitbox, "position", start_hitbox_position, time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	rope_tween.tween_property(rope, "size", Vector2(0, rope.size.y), time).set_trans(Tween.TRANS_SINE).set_ease(Tween.EASE_IN)
	
	await loop_tween.finished
	change_state(RopeState.WAITING)
	pass

func enter_throwing() -> void:
	hitbox.collision_mask = init_hitbox_mask
	stop_all_tweens()
	loop_tween = get_tree().create_tween()
	rope_tween = get_tree().create_tween()

	var time = player.player_data.rope_distance / player.player_data.rope_speed
	loop_tween.tween_property(hitbox, "position", Vector2(position.x + player.player_data.rope_distance, position.y), time)
	rope_tween.tween_property(rope, "size", Vector2(player.player_data.rope_distance + 16, rope.size.y), time)

	await loop_tween.finished
	if rope_state == RopeState.THROWING:
		change_state(RopeState.RETURNING)
	pass

func stop_all_tweens() -> void:
	if loop_tween:
		loop_tween.stop()
	if rope_tween:
		rope_tween.stop()
	pass