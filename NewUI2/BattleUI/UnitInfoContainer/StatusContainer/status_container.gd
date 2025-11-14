class_name StatusContainer extends VBoxContainer

#@onready var armor_container = $ArmorContainer
#@onready var health_container = $HealthContainer
#@onready var heat_container = $HeatContainer

@onready var armor_progress_bar = $ArmorContainer/ProgressBar
@onready var health_progress_bar = $HealthContainer/ProgressBar
@onready var heat_progress_bar = $HeatContainer/ProgressBar


var unit : SimpleMech = null : set = _setup_ui

func _setup_ui(_unit: SimpleMech) -> void:
	if _unit:
		unit = _unit
		armor_progress_bar.max_value = unit.health_manager.max_armor
		armor_progress_bar.value = unit.health_manager.current_armor
	
		health_progress_bar.max_value = unit.health_manager.max_health
		health_progress_bar.value = unit.health_manager.current_armor
		
		unit.health_manager.armor_updated.connect(_update_armor)
		unit.health_manager.health_updated.connect(_update_health)

#func setup_ui(unit: SimpleMech) -> void:

	#
	#unit.health_manager.armor_updated.connect(_update_armor)
	#unit.health_manager.health_updated.connect(_update_health)

func _exit_tree():
	if unit:
		if unit.health_manager.armor_updated.is_connected(_update_armor):
			unit.health_manager.armor_updated.disconnect(_update_armor)
		if unit.health_manager.health_updated.is_connected(_update_health):
			unit.health_manager.health_updated.disconnect(_update_health)

func _update_health(value: int) -> void:
	health_progress_bar.value = value

func _update_armor(value: int) -> void:
	armor_progress_bar.value = value
