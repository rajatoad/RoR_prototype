class_name LimbStatusUI extends GridContainer

const limb_container = preload("res://UI/Battle/Limbs/limb_container.tscn")
#@export var limbs : Array[Limb] = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	setup_limb_ui()

	pass # Replace with function body.

func setup_limb_ui() -> void:
	for l in PlayerManager.mecha.limbs:
		var limb_ui_scene : LimbContainer = limb_container.instantiate()
		self.add_child(limb_ui_scene)
		limb_ui_scene.limb = l
		#limb_ui_scene.setup_limb_ui()
		
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
