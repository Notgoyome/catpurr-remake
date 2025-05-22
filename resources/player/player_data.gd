@tool

extends Resource
class_name PlayerData

@export var speed : float = 200.0
@export var time_to_max_speed : float = 0.5:
    set(value):
        time_to_max_speed = value
        _acceleration = speed / time_to_max_speed

@export var time_to_stop : float = 0.5:
    set(value):
        time_to_stop = value
        _friction = speed / time_to_stop

@export var _acceleration : float = 2000.0
var _friction : float = 2000.0

@export var rope_distance : float = 100.0
@export var rope_speed : float = 200.0
@export var rope_recover_speed : float = 200.0
@export var rope_capture_wait_time : float = 0.5