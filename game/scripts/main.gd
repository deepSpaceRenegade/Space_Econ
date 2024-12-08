extends Node2D

@onready var selection_box: NinePatchRect = $SelectionBox

var turn_count:int = 0
var ships:Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	SignalBus.end_turn.connect(_end_turn)

func _process(delta: float) -> void:
#check if box select is actually moving to continue and add ships then
	if selection_box.rectangle_area.abs().has_area():
		ships = get_tree().get_nodes_in_group("ships")
		for ship in ships:
			var is_selected = selection_box.rectangle_area.abs().has_point(ship.position)
			if is_selected == true:
				ship.ship_selected()
			else:
				ship.ship_deselected()

func _end_turn():
	#print(turn_count)
	turn_count += 1
