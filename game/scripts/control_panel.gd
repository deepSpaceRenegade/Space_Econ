extends CanvasLayer

@export var planet: PackedScene
@export var planets_list: Array[PlanetInfo]
@export var planets_list2: Array[PlanetInfo]

@onready var control_panel: CanvasLayer = $"."
@onready var close_button: Button = $Control_Panel_Container/Control_Panel/Close_Button
@onready var planet_box: HBoxContainer = $Control_Panel_Container/Control_Panel/MenuContainer/PlanetBox
@onready var info_box: VBoxContainer = $Control_Panel_Container/Control_Panel/MenuContainer/InfoBox
@onready var planet_label: Label = $Control_Panel_Container/Control_Panel/MenuContainer/PlanetLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close_button.pressed.connect(close_panel)

	Signals.populate_planets.connect(Callable(self, "populate_planets").bind(planets_list))
	Signals.populate_planets2.connect(Callable(self, "populate_planets").bind(planets_list2))
	Signals.show_planet_info.connect(Callable(self, "show_planet_info").bind(planets_list))


func close_panel():
	control_panel.hide()

	for child in planet_box.get_children():
		child.queue_free()
	
	for child in info_box.get_children():
		child.queue_free()

func populate_planets(list):
	for child in planet_box.get_children():
		child.queue_free()
	for info in list:
		var planet_instance = planet.instantiate()
		planet_instance.name = info.planet_name
		planet_instance.texture_normal = info.texture
		planet_box.add_child(planet_instance)

func show_planet_info(planet_name, list):
	for child in info_box.get_children():
		child.queue_free()
	planet_label.text = planet_name
	var info_label = Label.new()
	info_box.add_child(info_label)
	
	for info in list:
		if info.planet_name == planet_name:
			info_label.text = "Population: " + str(info.planet_population)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
