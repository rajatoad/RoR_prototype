class_name BattleManager extends Node

@export var player_mech : Mecha = null
@export var enemy_mech : Mecha = null
@onready var clock_label: Label = $Control/Clock

var clock : float = 0

var is_clock_stopped : bool = false


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if not is_clock_stopped:
		clock += delta
	clock_label.text = str(roundi(clock))
	
	#if clock > 2:
		#handle_attack(player_mech.attack_limb_manager.use_weapon(), player_mech.core_limb_manager.limbs[0])
	

func pause_battle_clock(time : float) -> void:
	is_clock_stopped = true
	await get_tree().create_timer(time).timeout
	is_clock_stopped = false

func handle_attack(damage_data : DamageData, target : Limb) -> void:
	target.handle_on_hit(damage_data, 100)
	pass
