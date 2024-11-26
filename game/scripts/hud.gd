extends CanvasLayer

@onready var universe_screen: Button = $"Universe Screen"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_universe_screen_pressed() -> void:
	SceneLoader.load_scene("res://scenes/universe_level.tscn") # Replace with function body.
