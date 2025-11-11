class_name MovementLimbManager extends Node

var limbs : Array[MovementLimb] = []

func _init() -> void:
	pass

# Called when the node enters the scene tree for the first time.
func _ready():
	for l in get_children():
		if l.limb_data != null:
			limbs.append(l)
