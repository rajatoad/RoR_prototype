class_name UnitStatsContainer extends HBoxContainer

@onready var unit_name_label: Label = $UnitNameLabel
@onready var unit_armor_bar: ProgressBar = $UnitProgressBarContainer/UnitArmorBar
@onready var unit_health_bar: ProgressBar = $UnitProgressBarContainer/UnitHealthBar

@export var unit : SimpleMech = null

func _ready() -> void:
	if unit:
		initialize_ui()

func initialize_ui() -> void:
	unit_name_label.text = unit.unit_name
	unit_armor_bar.max_value = unit.health_manager.max_armor
	unit_armor_bar.value = unit.health_manager.current_armor
	unit_health_bar.max_value = unit.health_manager.max_health
	unit_health_bar.value = unit.health_manager.current_health
	
	unit.health_manager.armor_updated.connect(_update_armor)
	unit.health_manager.health_updated.connect(_update_health)

func _exit_tree() -> void:
	if unit:
		if unit.health_manager.armor_updated.is_connected(_update_armor):
			unit.health_manager.armor_updated.disconnect(_update_armor)
		if unit.health_manager.health_updated.is_connected(_update_health):
			unit.health_manager.health_updated.disconnect(_update_health)

func _update_armor(value : int) -> void:
	unit_armor_bar.value = value
	pass

func _update_health(value: int) -> void:
	unit_health_bar.value = value
