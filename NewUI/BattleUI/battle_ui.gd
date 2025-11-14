class_name BattleUI extends CanvasLayer

@onready var player_ui_container: HBoxContainer = $Control/PlayerUIContainer
@onready var player_action_container: VBoxContainer = $Control/PlayerUIContainer/PlayerActionContainer
@onready var player_unit_container: PlayerUnitContainer = $Control/PlayerUIContainer/PlayerUnitContainer
@onready var player_attack_container: PlayerAttackContainer = $Control/PlayerUIContainer/PlayerAttackContainer

signal attack_selection(attack: BasicAttack, target: SimpleMech)

func _ready():
	if PlayerManager.player_units.size() > 0:
		initialize_ui()
	player_attack_container.attack_selection_finished.connect(_attack_selection_finished)

func initialize_ui() -> void:
	player_unit_container.initialize_ui()
	setup_attack_container()

func setup_attack_container() -> void:
	player_attack_container.initialize_ui()

func _attack_selection_finished(attack : BasicAttack, target : SimpleMech) -> void:
	attack_selection.emit(attack, target)
	player_ui_container.show_unit_container()
