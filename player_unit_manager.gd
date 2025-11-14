class_name PlayerUnitManager extends Node2D

var player_units : Array[SimpleMech] = []

func _ready():
	for n in get_children():
		if n is SimpleMech:
			player_units.append(n)
	if player_units.size() > 0:
		PlayerManager.selected_unit = player_units[0]
		PlayerManager.player_units = player_units
