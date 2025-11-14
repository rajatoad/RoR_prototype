class_name BattleUI extends CanvasLayer

@onready var player_info_container: PlayerInfoContainer = $Control/PlayerInfoContainer
@onready var enemy_info_container: EnemyInfoContainer = $Control/EnemyInfoContainer


# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
	#pass

func setup_ui() -> void:
	if GlobalBattleManager.player_units and GlobalBattleManager.enemy_units:
		player_info_container.setup_ui()
		enemy_info_container.setup_ui()
