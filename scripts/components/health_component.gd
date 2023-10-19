class_name HealthComponent
extends Node

# Vida maxima
@export var MAX_HEALTH : int
@export var resistence : int

# Vida actual con la cual se interactuara
@onready var current_health := MAX_HEALTH:
	set(value):
		current_health = value
		current_health = clampi(current_health, 0, MAX_HEALTH)
		if current_health <= 0:
			kill()

# Añadir vida
func heal(value : int) -> void:
	current_health += value

# Restar vida
func damage(value : int) -> void:
	current_health -= value

# Eliminar padre (Futuramente se cambiara a una señal)
func kill() -> void:
	get_parent().queue_free()
