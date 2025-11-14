class_name UnitContainer extends VBoxContainer

signal unit_selected

@onready var unit_name_label: Label = $UnitNameLabel
@onready var select_button: Button = $SelectButton

@export var unit: SimpleMech = null

func _ready() -> void:
	if unit:
		setup_ui()
	select_button.button_up.connect(_select_unit)

func setup_ui() -> void:
	if unit:
		unit_name_label.text = unit.unit_name
	pass

func _select_unit() -> void:
	if unit:
		PlayerManager.selected_unit = unit
		unit_selected.emit()

func _exit_tree() -> void:
	if select_button.button_up.is_connected(_select_unit):
		select_button.button_up.disconnect(_select_unit)
