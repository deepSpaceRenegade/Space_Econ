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
	star.pressed.connect(populate_star)
	star_2.pressed.connect(populate_star2)

func populate_star():
	Signals.emit_signal("populate_planets")

func populate_star2():
	Signals.emit_signal("populate_planets2")

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

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
