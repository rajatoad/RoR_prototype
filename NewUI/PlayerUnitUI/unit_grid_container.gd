class_name UnitGridContainer extends GridContainer

#var unit_stats_container_scene = preload("res://NewUI/unit_stats_container.tscn")

#signal player_unit_selected(selected_unit : SimpleMech)

@export var player_units : Array[SimpleMech] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
