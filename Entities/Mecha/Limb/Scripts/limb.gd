class_name Limb extends Node

signal limb_inactive(limb : Limb)
signal limb_active(limb : Limb)
signal limb_destroyed(limb : Limb)
signal limb_undestroyed(limb : Limb)

signal armor_updated(limb : Limb)
signal health_updated(limb : Limb)

@export var limb_data : LimbData

var current_health : int = 100
var current_armor : int = 100

var max_health : int = 100
var max_armor : int = 100

var is_active: bool = true
var is_destroyed: bool = false

func _ready() -> void:
	if limb_data != null:
		current_health = limb_data.health
		current_armor = limb_data.armor
		max_health = limb_data.health
		max_armor = limb_data.armor

func handle_heal(amount: int) -> void:
	_update_health(-amount)
	if not is_active and current_health >= (limb_data.health / 2):
		is_active = true
		limb_active.emit(self)
	if not is_active and is_destroyed and current_health > 0:
		is_destroyed = false
		limb_undestroyed.emit(self)

func handle_armor_heal(amount: int) -> void:
	_update_armor(-amount)

func handle_on_hit(damage_data: DamageData, hit_chance: float) -> void:
	if limb_data.dodge_change < hit_chance:
		_handle_damage(damage_data)

func _handle_damage(damage_data: DamageData) -> void:
	if current_armor > 0:
		_update_armor(damage_data.damage)
	elif current_health > 0:
		_update_health(damage_data.damage)

func _update_armor(amount: int) -> void:
	current_armor = clampi(current_armor - amount, 0, max_armor)
	armor_updated.emit(self)

func _update_health(amount : int) -> void:
	current_health = clampi(current_health - amount, 0, max_health)
	health_updated.emit(self)
	if current_health <= 0 and is_active and not is_destroyed:
		is_active = false
		is_destroyed = true
		limb_destroyed.emit(self)
	elif current_health <= (limb_data.health) / 2 and is_active:
		is_active = false
		limb_inactive.emit(self)
