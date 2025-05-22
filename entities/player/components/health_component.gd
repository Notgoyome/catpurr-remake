extends Node
class_name HealthComponent

@export var max_hp = 3
@export var initial_hp = 3
var hp = 0

@export var invincible = false
@export var invincible_time = 1.0
var invincible_timer : Timer = Timer.new()

signal on_damage(amount : int)
signal on_death()
signal on_heal(amount : int)
signal on_health_changed

func _ready():
	hp = initial_hp
	invincible_timer.set_wait_time(invincible_time)
	invincible_timer.one_shot = true
	invincible_timer.timeout.connect(disable_invincibility)

func damage(damage : int):
	if invincible:
		return

	hp -= damage
	emit_signal("on_damage", damage)
	on_health_changed.emit(hp)
	if hp <= 0:
		emit_signal("on_death")

func heal(amount : int):
	hp = min(hp + amount, max_hp)
	on_heal.emit(amount)
	on_health_changed.emit(hp)


func set_invincibility(time : float = invincible_time):
	invincible = true
	invincible_time = time
	invincible_timer.start()

func disable_invincibility():
	invincible = false
	invincible_timer.stop()
