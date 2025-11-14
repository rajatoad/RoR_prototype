class_name SkillContainer extends VBoxContainer

signal select_skill_button_clicked(skill: BasicAttack)

@onready var name_label: Label = $NameLabel
@onready var damage_label: Label = $DamageLabel
@onready var cooldown_label: Label = $CooldownLabel
@onready var select_button: Button = $SelectButton

@export var skill : BasicAttack = null : set = setup_ui

#var is_on_cooldown : bool

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.

func setup_ui(_skill : BasicAttack ) -> void:
	if _skill:
		skill = _skill
		name_label.text = skill.attack_name
		damage_label.text = str(skill.damage)
		cooldown_label.text = str(roundi(skill.cooldown))
		select_button.button_up.connect(_select_button_clicked)

func _exit_tree():
	if skill:
		if select_button.button_up.is_connected(_select_button_clicked):
			select_button.button_up.disconnect(_select_button_clicked)


func _select_button_clicked() -> void:
	select_skill_button_clicked.emit(skill)
	#GlobalBattleManager.
	#basic_attack.use_attack()
	select_button.disabled = true
	select_button.text = "NA"


func _process(_delta):
	if skill:
		if skill.is_on_cooldown:
			cooldown_label.text = str(roundi(skill.cooldown_timer.time_left))
		else:
			cooldown_label.text = str(roundi(skill.cooldown))
			select_button.disabled = false
