class_name SimpleMech extends Node2D

#signal mech_destroyed

@onready var attack_manager: AttackManager = $AttackManager
@onready var health_manager: HealthManager = $HealthManager

@export var accuracy : int = 20
@export var evasion : int = 10

var is_destroyed : bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	health_manager.health_destroyed.connect(_mech_destroyed)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func apply_damage(damage: int) -> void:
	health_manager.apply_damage(damage)

func _mech_destroyed() -> void:
	is_destroyed = true
