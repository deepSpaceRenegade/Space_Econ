extends TextureButton

@export var planets_list: Array[PlanetInfo]

@onready var star: TextureButton = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	star.pressed.connect(panel_emit)
	star.pressed.connect(populate_star)

func panel_emit():
	Signals.emit_signal("open_control_panel")

func populate_star():
	Signals.populate_planets.emit(star.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
