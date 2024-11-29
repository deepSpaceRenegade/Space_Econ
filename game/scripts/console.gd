extends CanvasLayer

const InputResponse = preload("res://scenes/response_text.tscn")

@onready var command_processor = $CommandProcessor
@onready var display_rows = $ConsoleContainer/ConsoleMargins/ConsoleRows/ConsoleDisplay/ConsoleScroll/DisplayRows
@onready var scroll = $ConsoleContainer/ConsoleMargins/ConsoleRows/ConsoleDisplay/ConsoleScroll
@onready var scroll_bar = scroll.get_v_scroll_bar()

@export var max_line_hitory:int = 30

var max_scroll_length:int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	scroll_bar.changed.connect(handle_scrollbar)
	max_scroll_length = scroll_bar.max_value

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func handle_scrollbar():
	if max_scroll_length != scroll_bar.max_value:
		max_scroll_length = scroll_bar.max_value
		scroll.scroll_vertical = max_scroll_length


func _on_input_text_submitted(new_text: String) -> void:
	if new_text.is_empty():
		return
	var input_response = InputResponse.instantiate()
	var response = command_processor.process(new_text)
	input_response.response_text(response)
	display_rows.add_child(input_response)
	
	delete_history_limit()


func delete_history_limit():
	if display_rows.get_child_count() > max_line_hitory:
		var rows_to_delete = display_rows.get_child_count() - max_line_hitory
		for i in range(rows_to_delete):
			display_rows.get_child(i).queue_free()
