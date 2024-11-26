extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func calculate_population():
	var stars = $/root/Galaxy/Stars.get_children()
	for star in stars:
		for info in star.planets_list:
			info.planet_population += 100


func _on_end_turn_button_pressed() -> void:
	calculate_population()
