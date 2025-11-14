class_name UnitsContainer extends VBoxContainer

var unit_container_scene = preload("res://NewUI2/BattleUI/UnitsContainer/unit_container.tscn")

var units: Array[SimpleMech] = [] : set = setup_ui
#
## Called when the node enters the scene tree for the first time.
#func _ready():
	#if units.size() > 0:
		#setup_ui()
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func setup_ui(_units: Array[SimpleMech]) -> void:
	if _units:
		units = _units
		for n in get_children():
			n.queue_free()
		for u in units:
			var new_scene : UnitContainer = unit_container_scene.instantiate()
			self.add_child(new_scene)
			new_scene.unit = u
		#new_scene.setup_ui()
