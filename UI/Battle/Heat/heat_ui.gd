class_name HeatUI extends VBoxContainer

@onready var label: Label = $Label
@onready var progress_bar: ProgressBar = $ProgressBar

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	label.text = "Normal Heat"
	progress_bar.max_value = PlayerManager.mecha.max_heat
	progress_bar.value = PlayerManager.mecha.heat
	PlayerManager.mecha.overheated.connect(_overheated)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	progress_bar.value = PlayerManager.mecha.heat

func _overheated(status : bool) -> void:
	if status:
		label.text = "OVERHEATED"
	else:
		label.text = "Normal Heat"
