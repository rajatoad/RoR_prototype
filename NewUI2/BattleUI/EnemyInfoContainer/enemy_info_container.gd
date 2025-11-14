class_name EnemyInfoContainer extends VBoxContainer

#@onready var units_container: UnitsContainer = $UnitsContainer
#@onready var unit_info_container: UnitInfoContainer = $UnitInfoContainer

@onready var enemy_units_container: UnitsContainer = $EnemyUnitsContainer

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func setup_ui() -> void:
	enemy_units_container.units = GlobalBattleManager.enemy_units
	#unit_info_container.select_unit = GlobalBattleManager.selected_player_unit
