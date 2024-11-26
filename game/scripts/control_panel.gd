extends CanvasLayer

@export var planet: PackedScene

@onready var control_panel: CanvasLayer = $"."
@onready var planet_box: HBoxContainer = $Control_Panel_Container/Control_Panel/MenuContainer/PlanetBox
@onready var info_box: VBoxContainer = $Control_Panel_Container/Control_Panel/MenuContainer/InfoBox
@onready var planet_label: Label = $Control_Panel_Container/Control_Panel/MenuContainer/PlanetLabel

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func close_panel():
	control_panel.visible = false

	for child in planet_box.get_children():
		child.queue_free()
	
	for child in info_box.get_children():
		child.queue_free()

	planet_label.text = ""


func _on_close_button_pressed() -> void:
	close_panel()
