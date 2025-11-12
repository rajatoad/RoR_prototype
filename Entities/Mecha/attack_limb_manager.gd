class_name AttackLimbManager extends Node

signal heat_generated(heat: float)

var limbs : Array[AttackLimb] = []

var selected_attack_limb : AttackLimb = null



func _init() -> void:
	pass

func _ready():
	for l in get_children():
		if l.limb_data != null:
			limbs.append(l)
	if limbs.size() > 0:
		selected_attack_limb = limbs[0]

func select_attack_limb(attack_limb: AttackLimb) -> void:
	if attack_limb != selected_attack_limb and attack_limb:
		selected_attack_limb = attack_limb

func use_weapon() -> DamageData:
	if selected_attack_limb and selected_attack_limb.is_active:
		var damage_data = selected_attack_limb.use_weapon()
		heat_generated.emit(selected_attack_limb.weapon_data.heat_generated)
		return damage_data
	return null
