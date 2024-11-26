extends TextureButton

@onready var planet: TextureButton = $"."

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass

func show_info():
	for child in ControlPanel.info_box.get_children():
		child.queue_free()
	ControlPanel.planet_label.text = planet.name
	var info_label = Label.new()
	ControlPanel.info_box.add_child(info_label)
	
	var stars = $/root/Galaxy.get_children()
	for star in stars:
		for info in star.planets_list:
			if info.planet_name == planet.name:
				info_label.text = "Population: " + str(info.planet_population)


func _on_pressed() -> void:
	show_info()
