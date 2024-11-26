extends TextureButton

@export var planets_list: Array[PlanetInfo]

@onready var star: TextureButton = $"."
@onready var planet_scene = preload("res://scenes/planet.tscn")


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func open_control_panel():
	ControlPanel.visible = true

func spawn_planets(list):
	for child in ControlPanel.planet_box.get_children():
		child.queue_free()
	for info in list:
		var planet_instance = planet_scene.instantiate()
		planet_instance.texture_normal = info.texture
		planet_instance.name = info.planet_name
		ControlPanel.planet_box.add_child(planet_instance)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_pressed() -> void:
	open_control_panel()
	spawn_planets(star.planets_list)
