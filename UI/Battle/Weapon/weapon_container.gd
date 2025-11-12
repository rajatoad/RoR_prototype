class_name WeaponContainer extends VBoxContainer

var weapon_data : WeaponData
var damage_data : DamageData
var ammo : int = 0

@onready var weapon_name: Label = $Name
@onready var texture_rect: TextureRect = $TextureRect
@onready var weapon_range: Label = $Range
@onready var cooldown: Label = $Cooldown
@onready var damage: Label = $Damage

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if weapon_data and damage_data:
		setup_ui()
		#weapon_name.text = weapon_data.name
		#if weapon_data.texture:
			#texture_rect.texture = weapon_data.texture
		#weapon_range.text = weapon_data.weapon_range
		#cooldown.text = "Cooldown: " + str(weapon_data.cooldown)
		#damage.text = "Damage: " + str(damage_data.damage)

func setup_ui() -> void:
	weapon_name.text = weapon_data.name
	if weapon_data.texture:
		texture_rect.texture = weapon_data.texture
	weapon_range.text = weapon_data.weapon_range
	cooldown.text = "Cooldown: " + str(weapon_data.cooldown)
	damage.text = "Damage: " + str(damage_data.damage)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#cooldown.text = PlayerManager.mecha.attack_limb_manager.
	#pass
