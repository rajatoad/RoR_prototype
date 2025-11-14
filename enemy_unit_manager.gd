class_name EnemyUnitManager extends Node2D

var enemy_units : Array[SimpleMech] = []

var selected_unit = null

func _ready():
	for n in get_children():
		if n is SimpleMech:
			enemy_units.append(n)
	if enemy_units.size() > 0:
		selected_unit = enemy_units[0]
		EnemyManager.enemy_units = enemy_units
