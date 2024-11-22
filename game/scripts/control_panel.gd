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

func close_panel():
	control_panel.hide()

	for child in planet_box.get_children():
		child.queue_free()
	
	for child in info_box.get_children():
		child.queue_free()

	planet_label.text = ""

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
