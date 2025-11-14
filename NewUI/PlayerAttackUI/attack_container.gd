class_name AttackContainer extends HBoxContainer

signal attack_selected(attack: BasicAttack)

@export var attack : BasicAttack = null

@onready var attack_name_label: Label = $AttackNameLabel
@onready var damage_label: Label = $DamageLabel
@onready var cooldown_label: Label = $CooldownLabel
@onready var select_button: Button = $SelectButton

func _ready() -> void:
	if attack:
		setup_ui()

func _process(_delta: float) -> void:
	if attack:
		if attack.is_on_cooldown:
			cooldown_label.text = "Cooldown: " + str(roundi(attack.cooldown_timer.time_left)) + "s"
			select_button.disabled = true
			select_button.text = "NA"
		else:
			cooldown_label.text = "Cooldown: Available"
			select_button.disabled = false
			select_button.text = "Select"

func setup_ui() -> void:
	attack_name_label.text = attack.attack_name
	damage_label.text = "Damage: " + str(attack.damage)
	cooldown_label.text = "Cooldown: Available"
	select_button.button_up.connect(_attack_selected)

func _attack_selected() -> void:
	attack_selected.emit(attack)
	PlayerManager.selected_unit.attack_manager.selected_attack = attack
