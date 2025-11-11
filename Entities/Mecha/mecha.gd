class_name Mecha extends AnimatableBody2D

@onready var core_limb_manager: CoreLimbManager = $CoreLimbManager
@onready var attack_limb_manager: AttackLimbManager = $AttackLimbManager
@onready var movement_limb_manager: MovementLimbManager = $MovementLimbManager

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
