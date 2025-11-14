class_name SelectArea2D extends Area2D

signal selected

var is_hovering : bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _mouse_enter():
	is_hovering = true

func _mouse_exit():
	is_hovering = false

func _input_event(viewport, event, shape_idx):
	if event.is_action_pressed("select") and is_hovering:
		selected.emit()
