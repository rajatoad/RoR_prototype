class_name EnemyUnitManager extends Node2D

var mecha : SimpleMech = null

var selected_unit = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for n in get_children():
		if n is SimpleMech:
			mecha = n
	if mecha:
		selected_unit = mecha

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass
