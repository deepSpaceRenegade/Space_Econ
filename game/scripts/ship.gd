extends Sprite2D

#maybe change this script to move the ship in increments per turn to a destination

const SHIP = preload("res://textures/ship.png")
const SHIP_SELECTED = preload("res://textures/ship_selected.png")

#add number of fighter ships on carrier
@export var max_distance:int = 50

var end_turn:bool = false
var selected:bool = false
var mouse_position:Vector2
var move:Vector2
var total_move_distance:int = 0
var speed:int = 100

func _ready() -> void:
	SignalBus.end_turn.connect(_turn_ended)

func _process(delta:float) -> void:
	if Input.is_action_just_pressed("mouse_click_right") and selected == true:
		mouse_position = get_local_mouse_position()
		end_turn = false
		move = position + mouse_position.limit_length(max_distance)

	total_move_distance = position.distance_to(mouse_position)
	if end_turn == true and selected == true: 
		_turn_move(move, delta)

func _turn_move(move:Vector2, delta:float):
	position = position.move_toward(move, speed * delta)

func _turn_ended():
	if end_turn == false:
		end_turn = true

func ship_selected():
	texture = SHIP_SELECTED
	selected = true

func ship_deselected():
	texture = SHIP
	selected = false

func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("mouse_click_left"):
		if selected == false:
			ship_selected()
		else:
			ship_deselected()
		end_turn = false
