class_name CoreLimbManager extends Node

var limbs : Array[Limb] = []

#signal limb_inactive(limb : Limb)
#signal limb_active(limb : Limb)
#signal limb_destroyed(limb : Limb)
#signal limb_undestroyed(limb : Limb)

func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	for l in get_children():
		if l.limb_data != null:
			limbs.append(l)
			l.limb_destroyed.connect(core_limb_destroyed)

func core_limb_destroyed(limb: Limb) -> void:
	print("Core limb destroyed: ", limb)
	pass

#func handle_damage(damage_data : DamageData, limb: Limb) -> void:
	#pass
