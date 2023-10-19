class_name InputComponent
extends Node

# Input para movimientos
var input_motion : Vector2:
	get:
		input_motion = Input.get_vector("ui_left","ui_right","ui_up","ui_down")
		return input_motion

# Input para interactuar
var input_action:
	get:
		input_action = Input.is_action_just_pressed("ui_accept")
		return input_action

# Input para atacar
var input_attack:
	get:
		input_attack = Input.is_action_just_pressed("attack")
		return input_attack
