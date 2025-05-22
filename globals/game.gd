extends Node

signal on_score_changed(new_score: int)
signal player_init(player: Player)
var current_score : int = 0:
    set(value):
        current_score = value
        print("Score updated to: ", value)
        on_score_changed.emit(value)

var current_level: Level
var player: Player :
    set(value):
        player = value
        player_init.emit(value)


func init_game(level: Level) -> void:
    current_level = level
    current_score = 0