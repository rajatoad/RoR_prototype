class_name UnitInfoContainer extends HBoxContainer

@onready var status_container: StatusContainer = $StatusContainer
@onready var skills_container: SkillsContainer = $SkillsContainer

var select_unit : SimpleMech = null : set = setup_ui

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func setup_ui(_select_unit) -> void:
	if _select_unit:
		select_unit = _select_unit
		
		status_container.unit = select_unit
		skills_container.skills = select_unit.attack_manager.attacks
