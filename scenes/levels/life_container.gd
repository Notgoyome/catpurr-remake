extends HBoxContainer

var lifeUI_scene : PackedScene = preload("res://ui/levels/life_ui.tscn")

var arranged_life_ui : Array = []
var life_ui : TextureRect = null
var player : Player = null

func _ready() -> void:
	if Game.player:
		player = Game.player
	else:
		print("Player not found, awaiting")
		await Game.player_init
	if !player:
		print("Player not found, exiting")
		return
	player.health_component.on_health_changed.connect(set_hp)
	print(player.health_component.hp)
	set_hp(player.health_component.hp)
	pass

func set_hp(life: int) -> void:
	for i in arranged_life_ui:
		i.queue_free()
	arranged_life_ui.clear()
	for i in range(life):
		life_ui = lifeUI_scene.instantiate()
		add_child(life_ui)
		arranged_life_ui.append(life_ui)
