class_name BasicAttack extends Node

@export var damage : int = 10
@export var cooldown: float = 5

var is_on_cooldown : bool = false

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func use_attack() -> int:
	if not is_on_cooldown:
		is_on_cooldown = true
		get_tree().create_timer(cooldown).timeout.connect(cooldown_finished)
		return damage
	else:
		return -1

func cooldown_finished() -> void:
	is_on_cooldown = false
