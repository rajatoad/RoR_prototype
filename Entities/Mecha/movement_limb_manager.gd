class_name MovementLimbManager extends Node

signal heat_generated(heat: float)

var limbs : Array[MovementLimb] = []

func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	for l in get_children():
		if l.limb_data != null:
			limbs.append(l)

func use_movement() -> void:
	var total_heat_generated = 0
	
	for l in limbs:
		total_heat_generated += l.limb_data.heat
	
	heat_generated.emit(total_heat_generated)
	
	pass
