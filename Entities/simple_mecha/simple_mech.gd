class_name SimpleMech extends Node2D

@onready var attack_manager: AttackManager = $AttackManager
@onready var health_manager: HealthManager = $HealthManager

@export var accuracy : int = 20
@export var evasion : int = 10

@export var unit_name : String = "Simple Mech"

var is_destroyed : bool = false

func _ready():
	health_manager.health_destroyed.connect(_mech_destroyed)

func apply_damage(damage: int) -> void:
	health_manager.apply_damage(damage)

func _mech_destroyed() -> void:
	is_destroyed = true
