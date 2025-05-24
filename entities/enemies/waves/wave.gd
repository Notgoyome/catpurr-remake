extends Node2D

class_name Wave

var nodes : Array[PackedScene] = []
func _ready() -> void:
    for child in get_children():
        nodes.append(child)
    
    pass # Replace with function body.

func _process(delta: float) -> void:
    # if nodes.size() == 0:
    #     print("Wave finished", nodes)
    #     queue_free()
            
            
    pass # Replace with function body.