class_name PlayerInfoContainer extends VBoxContainer

@onready var units_container: UnitsContainer = $UnitsContainer
@onready var unit_info_container: UnitInfoContainer = $UnitInfoContainer


# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func setup_ui() -> void:
	GlobalBattleManager.player_unit_selected.connect(_selected_player_unit)
	units_container.units = GlobalBattleManager.player_units
	if GlobalBattleManager.selected_player_unit:
		unit_info_container.select_unit = GlobalBattleManager.selected_player_unit

func _selected_player_unit() -> void:
	unit_info_container.select_unit = GlobalBattleManager.selected_player_unit
