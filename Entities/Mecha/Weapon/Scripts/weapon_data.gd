class_name WeaponData extends Resource

@export var name : String = "Gun"
@export_enum("Close Range", "Medium Range", "Long Range", "Ultra-Long Range") var weapon_range : String
@export var cooldown : float = 10
@export var heat_generated : float = 10
@export var texture : Texture = null
