class_name AttackSelectContainer extends VBoxContainer

var attack_container_scene = preload("res://NewUI/PlayerAttackUI/attack_container.tscn")

signal attack_selected(attack : BasicAttack)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	initialize_ui()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func initialize_ui() -> void:
	for n in get_children():
		n.queue_free()

	for a in PlayerManager.selected_unit.attack_manager.attacks:
		var new_scene : AttackContainer = attack_container_scene.instantiate()
		self.add_child(new_scene)
		new_scene.attack = a
		new_scene.setup_ui()
		new_scene.attack_selected.connect(_attack_selected)

func _attack_selected(attack : BasicAttack) -> void:
	attack_selected.emit(attack)
