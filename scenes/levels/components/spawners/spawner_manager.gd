extends Node
class_name SpawnManager

var list_spawners: Array[Spawner]

func _ready() -> void:
    list_spawners = []
    for child in get_children():
        if child is Spawner:
            list_spawners.append(child)