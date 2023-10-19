class_name VelocityComponent
extends Node

# Variable de velocidad
@export var speed : int

# Target al cual se le aplicara la velocidad
@onready var target : CharacterBody2D = get_parent()

# Función de movimiento
func move(delta : float, direction : Vector2) -> void:
	
	# Si hay dirección se mueve de forma suave
	if direction:
		target.velocity.x = move_toward(target.velocity.x, direction.x * speed, speed)
		target.velocity.y = move_toward(target.velocity.y, direction.y * speed, speed)
	
	# Si no hay direccón se detiene de forma suave
	else:
		target.velocity.x = move_toward(target.velocity.x, 0, speed)
		target.velocity.y = move_toward(target.velocity.y, 0, speed)
	
	# Aplicar movimiento
	target.move_and_slide()
