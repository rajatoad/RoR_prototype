class_name EnemyUnitContainer extends VBoxContainer

signal unit_selected(enemy_unit: SimpleMech)

@onready var unit_name_label: Label = $UnitNameLabel
@onready var select_button: Button = $SelectButton

@export var unit: SimpleMech = null

@onready var armor_bar: ProgressBar = $ArmorBar
@onready var health_bar: ProgressBar = $HealthBar

func _ready() -> void:
	if unit:
		setup_ui()
	select_button.button_up.connect(_select_unit)

func setup_ui() -> void:
	if unit:
		unit_name_label.text = unit.unit_name
		armor_bar.max_value = unit.health_manager.max_armor
		armor_bar.value = unit.health_manager.current_armor
		health_bar.max_value = unit.health_manager.max_health
		health_bar.value = unit.health_manager.current_health
		
		if not unit.health_manager.armor_updated.is_connected(_update_ui):
			unit.health_manager.armor_updated.connect(_update_ui)
		if not unit.health_manager.health_updated.is_connected(_update_ui):
			unit.health_manager.health_updated.connect(_update_ui)

func _select_unit() -> void:
	if unit:
		unit_selected.emit(unit)

func _exit_tree() -> void:
	if select_button.button_up.is_connected(_select_unit):
		select_button.button_up.disconnect(_select_unit)

func _update_ui(_value : int) -> void:
	setup_ui()
