class_name Level extends Node2D

@onready var player_units = $PlayerUnits
@onready var enemy_units = $EnemyUnits
@onready var battle_ui: BattleUI = $BattleUi

# Called when the node enters the scene tree for the first time.
func _ready():
	var _player_units : Array[SimpleMech] = []
	var _enemy_units : Array[SimpleMech] = []
	
	for c in player_units.get_children():
		if c is SimpleMech:
			c.is_player_unit = true
			_player_units.append(c)
	for c in enemy_units.get_children():
		if c is SimpleMech:
			_enemy_units.append(c)
	
	GlobalBattleManager.player_units = _player_units
	GlobalBattleManager.enemy_units = _enemy_units
	
	battle_ui.setup_ui()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
