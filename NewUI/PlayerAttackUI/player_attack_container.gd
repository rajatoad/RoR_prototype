class_name PlayerAttackContainer extends VBoxContainer

signal attack_selection_finished(attack : BasicAttack, target: SimpleMech)

@onready var select_unit_container: SelectUnitContainer = $SelectUnitContainer
@onready var attack_select_container: AttackSelectContainer = $AttackSelectContainer
@onready var target_select_container: TargetSelectContainer = $TargetSelectContainer

var selected_attack : BasicAttack = null
var selected_target : SimpleMech = null


func _ready() -> void:
	if PlayerManager.selected_unit:
		initialize_ui()

func initialize_ui() -> void:
	select_unit_container.visible = true
	attack_select_container.visible = false
	target_select_container.visible = false
	
	select_unit_container.initialize_ui()
	attack_select_container.initialize_ui()
	target_select_container.initialize_ui()
	
	if not select_unit_container.unit_selected.is_connected(unit_selected):
		select_unit_container.unit_selected.connect(unit_selected)
	
	if not attack_select_container.attack_selected.is_connected(attack_selected):
		attack_select_container.attack_selected.connect(attack_selected)
	
	if not target_select_container.target_selected.is_connected(target_selected):
		target_select_container.target_selected.connect(target_selected)


func unit_selected() -> void:
	select_unit_container.visible = false
	attack_select_container.visible = true
	target_select_container.visible = false

func attack_selected(attack : BasicAttack) -> void:
	selected_attack = attack
	select_unit_container.visible = false
	attack_select_container.visible = false
	target_select_container.visible = true

func target_selected(target: SimpleMech) -> void:
	selected_target = target
	select_unit_container.visible = false
	attack_select_container.visible = false
	target_select_container.visible = false
	attack_selection_finished.emit(selected_attack, selected_target)
