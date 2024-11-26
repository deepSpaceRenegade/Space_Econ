extends CanvasLayer

@export var planet: PackedScene

@onready var control_panel: CanvasLayer = $"."
@onready var close_button: Button = $Control_Panel_Container/Control_Panel/Close_Button
@onready var planet_box: HBoxContainer = $Control_Panel_Container/Control_Panel/MenuContainer/PlanetBox
@onready var info_box: VBoxContainer = $Control_Panel_Container/Control_Panel/MenuContainer/InfoBox
@onready var planet_label: Label = $Control_Panel_Container/Control_Panel/MenuContainer/PlanetLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	close_button.pressed.connect(close_panel)
	#Signals.populate_planets.connect(star_select)
	#Signals.show_planet_info.connect(planet_select)

func close_panel():
	control_panel.visible = false

	for child in planet_box.get_children():
		child.queue_free()
	
	for child in info_box.get_children():
		child.queue_free()

	planet_label.text = ""

#func populate_planets(list):
	#for child in ControlPanel.planet_box.get_children():
		#child.queue_free()
	#for info in list:
		#var planet_instance = ControlPanel.planet.instantiate()
		#planet_instance.name = info.planet_name
		#planet_instance.texture_normal = info.texture
		#ControlPanel.planet_box.add_child(planet_instance)

#func show_planet_info(planet_name, list):
	#for child in ControlPanel.info_box.get_children():
		#child.queue_free()
	#ControlPanel.planet_label.text = planet_name
	#var info_label = Label.new()
	#ControlPanel.info_box.add_child(info_label)
	#
	#for info in list:
		#if info.planet_name == planet_name:
			#info_label.text = "Population: " + str(info.planet_population)

#func star_select(selected_star):
		#populate_planets(selected_star.planet_list)
		#match selected_star:
		#"Star":
			#populate_planets($Star.planets_list)
		#"Star2":
			#populate_planets($Star2.planets_list)

#func planet_select(selected_planet):
	#match selected_planet:
		#"blue":
			#show_planet_info(selected_planet, $Star.planets_list)
		#"green":
			#show_planet_info(selected_planet, $Star2.planets_list)
