class_name BattleManager extends Node

@onready var player_unit_manager: PlayerUnitManager = $PlayerUnitManager
@onready var enemy_unit_manager: EnemyUnitManager = $EnemyUnitManager
@onready var battle_ui : BattleUI = $BattleUI

var player_target_unit = null
var enemy_target_unit = null

func _ready() -> void:
	pass

func initialize() -> void:
	pass

func update_player_target_unit(target: SimpleMech) -> void:
	if target:
		player_target_unit = target

func update_enemy_target_unit(target: SimpleMech) -> void:
	if target:
		enemy_target_unit = target

# ONLY BASED ON MECHA ATTACKS RN
func player_attack() -> void:
	var damage = player_unit_manager.selected_unit.attack_manager.use_selected_attack()
	if damage > 0:
		handle_attack(player_unit_manager.selected_unit, damage, player_target_unit)

func handle_attack(origin: SimpleMech, damage: int, target: SimpleMech) -> void:
	if origin.accuracy > target.evasion:
		target.apply_damage(damage)


func handle_move() -> void:
	pass
