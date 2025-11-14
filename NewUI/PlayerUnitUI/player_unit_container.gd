class_name PlayerUnitContainer extends VBoxContainer

var unit_stats_container_scene = preload("res://NewUI/PlayerUnitUI/unit_stats_container.tscn")

func _ready() -> void:
	if PlayerManager.player_units.size() > 0 :
		initialize_ui()

func initialize_ui() -> void:
	for n in get_children():
		n.queue_free()

	for unit in PlayerManager.player_units:
		var new_unit_stats_container : UnitStatsContainer = unit_stats_container_scene.instantiate()
		self.add_child(new_unit_stats_container)
		new_unit_stats_container.unit = unit
		new_unit_stats_container.initialize_ui()
