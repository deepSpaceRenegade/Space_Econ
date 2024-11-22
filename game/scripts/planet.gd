extends TextureButton

@onready var planet: TextureButton = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	planet.pressed.connect(show_info)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func show_info():
	Signals.show_planet_info.emit(planet.name)
