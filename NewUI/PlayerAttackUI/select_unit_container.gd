class_name SelectUnitContainer extends HBoxContainer

signal unit_selected

var unit_container_scene = preload("res://NewUI/PlayerAttackUI/unit_container.tscn")

func _ready() -> void:
	initialize_ui()

func initialize_ui() -> void:
	for n in get_children():
		n.queue_free()
	for u in PlayerManager.player_units:
		var new_scene : UnitContainer = unit_container_scene.instantiate()
		self.add_child(new_scene)
		new_scene.unit = u
		new_scene.setup_ui()
		new_scene.unit_selected.connect(unit_select)

func unit_select() -> void:
	unit_selected.emit()
