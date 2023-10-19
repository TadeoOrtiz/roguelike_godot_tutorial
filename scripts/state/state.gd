class_name State
extends Node

# Señal que se emite cada vez que se quiera cambiar de estado
signal transitioned(state : State, new_state_name : String, args : Dictionary)

# Referencia al target
var target : Node2D

# Referencia al nodo para animar
var anim : AnimationPlayer

# Función que se ejecuta al entrar al estado
func enter(args : Dictionary):
	pass

# Función que se ejecuta al salir al estado
func exit():
	pass

# Process del estado
func state_process(delta : float) -> void:
	pass

# Physics process del estado
func state_physics_process(delta : float) -> void:
	pass

# input del estado
func state_input(event : InputEvent) -> void:
	pass
