class_name BattleManager extends Node

@onready var player_unit_manager: PlayerUnitManager = $PlayerUnitManager
@onready var enemy_unit_manager: EnemyUnitManager = $EnemyUnitManager
@onready var battle_ui : BattleUI = $BattleUI

var player_target_unit = null
var enemy_target_unit = null

func _ready() -> void:
	PlayerManager.player_units = player_unit_manager.player_units
	EnemyManager.enemy_units = enemy_unit_manager.enemy_units
	initialize()
	pass

func initialize() -> void:
	battle_ui.initialize_ui()
	battle_ui.attack_selection.connect(battle_ui_attack_selected)

func update_player_target_unit(target: SimpleMech) -> void:
	if target:
		player_target_unit = target

func update_enemy_target_unit(target: SimpleMech) -> void:
	if target:
		enemy_target_unit = target

# ONLY BASED ON MECHA ATTACKS RN
func player_attack() -> void:
	var damage = PlayerManager.selected_unit.attack_manager.use_selected_attack()
	if damage > 0:
		handle_attack(PlayerManager.selected_unit, damage, player_target_unit)

func handle_attack(origin: SimpleMech, damage: int, target: SimpleMech) -> void:
	if origin.accuracy > target.evasion:
		target.apply_damage(damage)

func battle_ui_attack_selected(_attack: BasicAttack, target: SimpleMech) -> void:
	player_target_unit = target
	player_attack()

func handle_move() -> void:
	pass
