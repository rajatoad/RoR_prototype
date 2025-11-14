class_name TargetSelectContainer extends HBoxContainer

var enemy_unit_container_scene = preload("res://NewUI/PlayerAttackUI/enemy_unit_container.tscn")

signal target_selected(target : SimpleMech)

func _ready() -> void:
	initialize_ui()

func initialize_ui() -> void:
	for n in get_children():
		n.queue_free()

	for a in EnemyManager.enemy_units:
		var new_scene : EnemyUnitContainer = enemy_unit_container_scene.instantiate()
		self.add_child(new_scene)
		new_scene.unit = a
		new_scene.setup_ui()
		new_scene.unit_selected.connect(_unit_selected)

func _unit_selected(enemy_unit : SimpleMech) -> void:
	target_selected.emit(enemy_unit)
