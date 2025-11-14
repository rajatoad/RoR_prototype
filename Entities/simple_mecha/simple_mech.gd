class_name SimpleMech extends AnimatableBody2D

@onready var attack_manager: AttackManager = $AttackManager
@onready var health_manager: HealthManager = $HealthManager
@onready var select_area_2d: SelectArea2D = $SelectArea2D
@onready var sprite_2d: Sprite2D = $Sprite2D


@export var accuracy : int = 20
@export var evasion : int = 10

@export var unit_name : String = "Simple Mech"

#@onready var area_2d: Area2D = $Area2D

@export var is_player_unit : bool = false

#var is_hovering: bool = false
#
#
var is_destroyed : bool = false

func _ready():
	health_manager.health_destroyed.connect(_mech_destroyed)
	select_area_2d.selected.connect(_selected)

func apply_damage(damage: int) -> void:
	health_manager.apply_damage(damage)

func _mech_destroyed() -> void:
	is_destroyed = true

func _selected() -> void:
	if is_player_unit:
		GlobalBattleManager.selected_player_unit = self
		print(GlobalBattleManager.selected_player_unit)
	else:
		GlobalBattleManager.selected_enemy_unit = self

#func _input_event(viewport, event, shape_idx):
	#if Input.is_action_just_pressed("select"):
		#print("Selected: ", name)

#func _mouse_enter():
	#print("HAHHAHA")
	#is_hovering = true
#
#func _mouse_exit():
	#is_hovering = false
#
#func _input(event):
	##print("YOOOO")
	#if is_hovering and event.is_action_pressed("select"):
		#print("selected: ", name)
#func mouse_select() -> void:
	#pass



#func _input(event):
	#if Input.is_action_just_pressed("select"):
		
