extends CanvasLayer

func _ready() -> void:
	self.visible = false

func close_panel():
	self.visible = false

func _on_close_button_pressed() -> void:
	close_panel()

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("open_ui"):
		if self.visible == true:
			self.visible = false
		else:
			self.visible = true
