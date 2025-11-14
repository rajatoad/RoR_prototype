class_name PlayerUIContainer extends HBoxContainer


@onready var attack_button: Button = $PlayerActionContainer/AttackButton
@onready var defend_button: Button = $PlayerActionContainer/DefendButton
@onready var skill_button: Button = $PlayerActionContainer/SkillButton
@onready var move_button: Button = $PlayerActionContainer/MoveButton
@onready var status_button: Button = $PlayerActionContainer/StatusButton

@onready var player_unit_container: PlayerUnitContainer = $PlayerUnitContainer
@onready var player_attack_container: PlayerAttackContainer = $PlayerAttackContainer


func _ready() -> void:

	show_unit_container()
	
	attack_button.button_up.connect(_attack_button_clicked)
	defend_button.button_up.connect(_defend_button_clicked)
	skill_button.button_up.connect(_skill_button_clicked)
	move_button.button_up.connect(_move_button_clicked)
	status_button.button_up.connect(_status_button_clicked)


func show_unit_container() -> void:
	player_unit_container.visible = true
	player_attack_container.visible = false

func show_attack_container() -> void:
	player_unit_container.visible = false
	player_attack_container.visible = true

func _attack_button_clicked() -> void:
	player_attack_container.initialize_ui()
	show_attack_container()

func _defend_button_clicked() -> void:
	pass

func _skill_button_clicked() -> void:
	pass

func _move_button_clicked() -> void:
	pass

func _status_button_clicked() -> void:
	show_unit_container()
