class_name Mecha extends AnimatableBody2D

@onready var core_limb_manager: CoreLimbManager = $CoreLimbManager
@onready var attack_limb_manager: AttackLimbManager = $AttackLimbManager
@onready var movement_limb_manager: MovementLimbManager = $MovementLimbManager

@export var max_heat : float = 1000
@export var is_player_mecha : bool = false

var limbs : Array[Limb] = []

var heat : float = 0

signal overheated(status: bool)

var is_overheated : bool = false



# Called when the node enters the scene tree for the first time.
func _ready():
	if is_player_mecha:
		PlayerManager.mecha = self
	else:
		EnemyManager.mecha = self

	for l in core_limb_manager.limbs:
		limbs.append(l)
	for l in attack_limb_manager.limbs:
		limbs.append(l)
	for l in movement_limb_manager.limbs:
		limbs.append(l)
	
	attack_limb_manager.heat_generated.connect(heat_generated)
	movement_limb_manager.heat_generated.connect(heat_generated)
	#pass # Replace with function body.

func heat_generated(heat_value : float) -> void:
	heat += heat_value
	if heat > max_heat:
		is_overheated = true
		overheated.emit(true)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	if is_overheated:
		if heat <= max_heat:
			is_overheated = false
			overheated.emit(false)
	
	if heat > 0:
		heat -= delta
