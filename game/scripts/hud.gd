extends CanvasLayer

@onready var universe_screen: Button = $"Universe Screen"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	universe_screen.pressed.connect(show_universe)

func show_universe():
	Signals.emit_signal("show_universe")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
