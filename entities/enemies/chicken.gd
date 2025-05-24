@tool

extends Enemy
class_name Chicken
@onready var captured_particule: CPUParticles2D = %CapturedParticule
@onready var intro: Node2D = %Intro
@export var random_direction: bool = true

func _ready() -> void:
	if random_direction:
		intro.set_random_direction()
	pass

func set_captured(_rope: Rope) -> void:
	super(_rope)
	%AnimatedSprite2D.play("captured")
	captured_particule.emitting = true
	pass



func destroy() -> void:
	on_destroyed.emit()
	%AnimatedSprite2D.hide()
	%Shadow.hide()
	collision_shape_2d.disabled = true
	if captured_particule.emitting:
		await captured_particule.finished
	queue_free()
	pass