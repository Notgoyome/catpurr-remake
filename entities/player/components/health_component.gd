extends Node
class_name HealthComponent

@export var max_hp = 3
@export var initial_hp = 3
var hp = 0

@export var permanent_invincible = false
var invincible = false
@export var enable_iframe = true
@export var invincible_time = 1.0
var invincible_timer : Timer = Timer.new()


signal on_damage(amount : int)
signal on_death()
signal on_heal(amount : int)
signal on_health_changed

signal on_invicibility_started()
signal on_invicibility_ended

func _ready():
	hp = initial_hp
	invincible_timer.set_wait_time(invincible_time)
	invincible_timer.one_shot = true
	invincible_timer.timeout.connect(disable_invincibility)
	add_child(invincible_timer)

func damage(damage : int):
	if invincible or permanent_invincible:
		return

	hp -= damage
	if enable_iframe:
		set_invincibility()
	emit_signal("on_damage", damage)
	on_health_changed.emit(hp)
	if hp <= 0:
		emit_signal("on_death")

func heal(amount : int):
	hp = min(hp + amount, max_hp)
	on_heal.emit(amount)
	on_health_changed.emit(hp)


func set_invincibility():
	invincible = true
	on_invicibility_started.emit()
	invincible_timer.set_wait_time(invincible_time)
	invincible_timer.start()

func disable_invincibility():
	invincible = false
	on_invicibility_ended.emit()
	invincible_timer.stop()
