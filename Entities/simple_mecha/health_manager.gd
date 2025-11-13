class_name HealthManager extends Node

@export var max_health : int = 100
@export var max_armor : int = 50

@export var current_health : int = 100
@export var current_armor : int = 50

signal armor_destroyed
signal health_destroyed


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func apply_damage(damage: int) -> void:
	if current_armor > 0:
		current_armor = clampi(current_armor - damage, 0, max_armor)
	elif current_health > 0:
		current_health = clampi(current_health - damage, 0, max_health)
	
	if current_armor == 0:
		armor_destroyed.emit()
	if current_health == 0:
		health_destroyed.emit()
