extends Node

var player_units : Array[SimpleMech] = [] : set = _set_player_units
var enemy_units : Array[SimpleMech] = [] : set = _set_enemy_units

var selected_player_unit : SimpleMech = null : set = _set_selected_player_unit
var selected_enemy_unit : SimpleMech = null : set = _set_selected_enemy_unit

signal player_unit_selected()
signal enemy_unit_selected()

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func _set_player_units(units: Array[SimpleMech]) -> void:
	player_units = units

func _set_enemy_units(units: Array[SimpleMech]) -> void:
	enemy_units = units

func _set_selected_player_unit(unit : SimpleMech) -> void:
	selected_player_unit = unit
	player_unit_selected.emit()

func _set_selected_enemy_unit(unit : SimpleMech) -> void:
	selected_player_unit = unit
	enemy_unit_selected.emit()
