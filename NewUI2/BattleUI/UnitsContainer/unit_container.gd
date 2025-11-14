class_name UnitContainer extends VBoxContainer

@onready var name_label = $NameLabel
@onready var texture_rect = $TextureRect
@onready var armor_bar = $ArmorBar
@onready var health_bar = $HealthBar

var unit : SimpleMech = null : set = _setup_ui

func _setup_ui(_unit: SimpleMech) -> void:
	if _unit:
		unit = _unit
		name_label.text = unit.unit_name
		texture_rect.texture = unit.sprite_2d.texture
		armor_bar.max_value = unit.health_manager.max_armor
		health_bar.max_value = unit.health_manager.max_health
		armor_bar.value = unit.health_manager.current_armor
		health_bar.value = unit.health_manager.current_health
		
		unit.health_manager.armor_updated.connect(_update_armor)
		unit.health_manager.health_updated.connect(_update_health)

func _exit_tree():
	if unit:
		if unit.health_manager.armor_updated.is_connected(_update_armor):
			unit.health_manager.armor_updated.disconnect(_update_armor)
		if unit.health_manager.health_updated.is_connected(_update_health):
			unit.health_manager.health_updated.disconnect(_update_health)

func _update_health(value: int) -> void:
	health_bar.value = value

func _update_armor(value: int) -> void:
	armor_bar.value = value
