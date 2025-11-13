class_name AttackManager extends Node

var attacks : Array[BasicAttack] = []

var selected_attack : BasicAttack = null

# Called when the node enters the scene tree for the first time.
func _ready():
	for a in get_children():
		if a is BasicAttack:
			attacks.append(a)
	
	if attacks.size() > 0:
		selected_attack = attacks[0]


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func use_selected_attack() -> int:
	if not selected_attack.is_on_cooldown:
		return selected_attack.use_attack()
	return -1

func change_selected_attack(index: int) -> void:
	selected_attack = attacks[index]
