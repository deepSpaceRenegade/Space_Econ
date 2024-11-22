extends Node2D
#use resource to populate control panel with unique data
@onready var control_panel: CanvasLayer = $Control_Panel
@onready var galaxy = $Galaxy
@onready var galaxy2 = $Galaxy2
@onready var stars = [$Star, $Star2]
@onready var stars2 = [$Star3, $Star4]
@onready var star: TextureButton = $Star
@onready var star_2: TextureButton = $Star2


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	Signals.connect("open_control_panel", open_control_panel)
	Signals.connect("show_universe", show_universe)
	
	galaxy.pressed.connect(show_stars)
	galaxy2.pressed.connect(show_stars2)

	
	Signals.populate_planets.connect(star_select)
	Signals.show_planet_info.connect(planet_select)

func open_control_panel():
	control_panel.show()

func show_universe():
	for star in stars:
		star.hide()
	for star in stars2:
		star.hide()
	galaxy.show()
	galaxy2.show()
	
func show_stars():
	galaxy.hide()
	galaxy2.hide()
	
	for star in stars:
		star.show()

func show_stars2():
	galaxy.hide()
	galaxy2.hide()
	
	for star in stars2:
		star.show()

func populate_planets(list):
	for child in control_panel.planet_box.get_children():
		child.queue_free()
	for info in list:
		var planet_instance = control_panel.planet.instantiate()
		planet_instance.name = info.planet_name
		planet_instance.texture_normal = info.texture
		control_panel.planet_box.add_child(planet_instance)

func show_planet_info(planet_name, list):
	for child in control_panel.info_box.get_children():
		child.queue_free()
	control_panel.planet_label.text = planet_name
	var info_label = Label.new()
	control_panel.info_box.add_child(info_label)
	
	for info in list:
		if info.planet_name == planet_name:
			info_label.text = "Population: " + str(info.planet_population)

func star_select(selected_star):
	match selected_star:
		"Star":
			populate_planets($Star.planets_list)
		"Star2":
			populate_planets($Star2.planets_list)

func planet_select(selected_planet):
	match selected_planet:
		"blue":
			show_planet_info(selected_planet, $Star.planets_list)
		"green":
			show_planet_info(selected_planet, $Star2.planets_list)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
