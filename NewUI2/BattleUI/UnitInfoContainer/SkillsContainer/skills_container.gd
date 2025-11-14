class_name SkillsContainer extends HBoxContainer

var skill_container_scene = preload("res://NewUI2/BattleUI/UnitInfoContainer/SkillsContainer/skill_container.tscn")

var skills : Array[BasicAttack] = [] : set = setup_ui

signal skill_selected(skill : BasicAttack)



# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func setup_ui(_skills : Array[BasicAttack]) -> void:
	for n in get_children():
		n.queue_free()

	skills = _skills
	for s in skills:
		var new_scene : SkillContainer = skill_container_scene.instantiate()
		self.add_child(new_scene)
		new_scene.skill = s
		new_scene.select_skill_button_clicked.connect(_skill_selected)

func _skill_selected(skill : BasicAttack) -> void:
	skill_selected.emit(skill)
