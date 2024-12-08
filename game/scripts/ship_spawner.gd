extends Marker2D

#@export var ship_types: Array[PackedScene] = []

@onready var ship_scene = preload("res://scenes/ship.tscn")

func _ready() -> void:
	SignalBus.ship_spawn.connect(spawn_ship)

func spawn_ship(current_star):
	var new_ship = ship_scene.instantiate()
	current_star.add_child(new_ship)
