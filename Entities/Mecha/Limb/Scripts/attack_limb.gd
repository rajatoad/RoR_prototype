class_name AttackLimb extends Limb

signal out_of_ammo
signal heat_generated(heat: float)

@export var weapon_data : WeaponData = null

@export var damage_data : DamageData = null

@export var ammo : int = 10

var can_shoot : bool = true

var _timer : float = 10

# Called when the node enters the scene tree for the first time.
func _ready():
	if weapon_data:
		_timer = weapon_data.cooldown

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if is_active:
		if can_shoot == false and ammo > 0:
			_timer -= delta
		elif _timer <= 0 and ammo > 0:
			can_shoot = true
	else:
		_timer = 10
		can_shoot = false


func use_weapon() -> DamageData:
	if is_active:
		if can_shoot and ammo > 0:
			ammo -= 1
			can_shoot = false
			heat_generated.emit(weapon_data.heat_generated)
		if ammo == 0:
			can_shoot = false
			out_of_ammo.emit()
		return damage_data
	return null
