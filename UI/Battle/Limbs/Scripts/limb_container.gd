class_name LimbContainer extends VBoxContainer

var limb : Limb : set = _set_limb
@onready var label: Label = $Label
@onready var texture_rect: TextureRect = $TextureRect
@onready var armor: ProgressBar = $Armor
@onready var health: ProgressBar = $Health


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if limb:
		setup_limb_ui()
		

func _set_limb(new_limb: Limb) -> void:
	if new_limb != limb and new_limb != null:
		limb = new_limb
		setup_limb_ui()

func setup_limb_ui() -> void:
	if limb:
		label.text = limb.limb_data.limb_type
		
		armor.max_value = limb.limb_data.armor
		armor.value = limb.current_armor
		
		health.max_value = limb.limb_data.health
		health.value = limb.current_health
		
		# UPDATE LIMB TEXTURE
		if limb.limb_data.texture:
			texture_rect.texture = limb.limb_data.texture
		
		limb.armor_updated.connect(update_armor)
		limb.health_updated.connect(update_health)

## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func update_health(_limb: Limb) -> void:
	health.value = limb.current_health
	#pass

func update_armor(_limb: Limb) -> void:
	armor.value = limb.current_armor
