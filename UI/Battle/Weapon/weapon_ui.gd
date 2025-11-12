class_name WeaponUI extends VBoxContainer

var WEAPON_CONTAINER = preload("res://UI/Battle/Weapon/weapon_container.tscn")

var attack_limbs : Array[AttackLimb] = []

#var weapons : Array[WeaponData] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	attack_limbs = PlayerManager.mecha.attack_limb_manager.limbs
	#for a in PlayerManager.mecha.attack_limb_manager.limbs:
		#if a.weapon_data:
			#weapons.append(a.weapon_data)
	setup_weapon_ui()
	#pass # Replace with function body.

func setup_weapon_ui() -> void:
	for l in attack_limbs:
		if l.weapon_data and l.damage_data:
			var weapon_container : WeaponContainer = WEAPON_CONTAINER.instantiate()
			self.add_child(weapon_container)
			weapon_container.weapon_data = l.weapon_data
			weapon_container.damage_data = l.damage_data
			weapon_container.ammo = l.ammo
			weapon_container.setup_ui()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
