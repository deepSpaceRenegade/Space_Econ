extends NinePatchRect

const min_drag_squared:int = 128

var is_clicked:bool = false
var rectangle_area:Rect2

func _ready() -> void:
	visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("box_select"):
		rectangle_area.position = get_global_mouse_position()
		position = rectangle_area.position
		is_clicked = true
	if event.is_action_released("box_select"):
		is_clicked = false
		visible = false

func _process(delta: float) -> void:
	if is_clicked:
		rectangle_area.size = get_global_mouse_position() - rectangle_area.position
		_update_selection_box()
		if !visible:
			if rectangle_area.size.length_squared() > min_drag_squared:
				visible = true

func _update_selection_box() -> void:
	size = abs(rectangle_area.size)
	if rectangle_area.size.x < 0:
		scale.x = -1
	else:
		scale.x = 1
	if rectangle_area.size.y < 0:
		scale.y = -1
	else:
		scale.y = 1
