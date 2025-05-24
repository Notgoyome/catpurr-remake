extends Area2D
class_name Bullet

@export var bullet_data: BulletData
signal bullet_hit

var _timer : Timer = Timer.new()

func _ready() -> void:
    _timer.set_wait_time(bullet_data.lifetime)
    _timer.one_shot = true
    var on_timeout = func () -> void:
        queue_free()
    _timer.timeout.connect(on_timeout)
    add_child(_timer)
    _timer.start()

func _on_body_entered(body:Node2D) -> void:
    if body is Player:
        var player = body as Player
        player.health_component.damage(bullet_data.damage)
        bullet_hit.emit()
        queue_free()
    pass # Replace with function body.
