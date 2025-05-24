extends Area2D


func _on_body_entered(body:Node2D) -> void:
    if body is Player:
        var player: Player = body as Player
        player.health_component.damage(1)
    pass # Replace with function body.
