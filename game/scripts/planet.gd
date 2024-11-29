extends TextureButton

@onready var planet: TextureButton = $"."
@onready var control_panel = $/root/Main/ControlPanel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func show_info():
	
	for child in control_panel.info_box.get_children():
		child.queue_free()
	control_panel.planet_label.text = planet.name
	var info_label = Label.new()
	control_panel.info_box.add_child(info_label)
	
	var stars = $/root/Main/Stars.get_children()
	for star in stars:
		for info in star.planets_list:
			if info.planet_name == planet.name:
				info_label.text = "Population: " + str(info.planet_population)


func _on_pressed() -> void:
	show_info()
