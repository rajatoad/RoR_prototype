class_name BasicAttack extends Node

@export var attack_name : String = "Basic Attack"
@export var damage : int = 10
@export var cooldown: float = 5

var is_on_cooldown : bool = false

@onready var cooldown_timer: Timer = $CooldownTimer


# Called when the node enters the scene tree for the first time.
func _ready():
	cooldown_timer.wait_time = cooldown
	cooldown_timer.timeout.connect(cooldown_finished)
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func use_attack() -> int:
	if not is_on_cooldown:
		is_on_cooldown = true
		#get_tree().create_timer(cooldown).timeout.connect(cooldown_finished)
		cooldown_timer.start()
		return damage
	else:
		return -1

func cooldown_finished() -> void:
	is_on_cooldown = false
	cooldown_timer.stop()
	cooldown_timer.wait_time = cooldown
