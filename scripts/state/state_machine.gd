class_name StateMachine
extends Node

# Estado inicial
@export var inital_state : State 

# Nodo para animar
@export var animation_player : AnimationPlayer 

# Padre o nodo en el cual se efectuaran los cambios
@export var target : Node2D 

# Diccionario donde estaran los estados
# {
#	"Idle" : Node#Idle,
# }
var states : Dictionary

# Estado actual
var current_state : State

func _ready():
	for child in get_children():
		
		# Asignar a cada estado sus referencias
		child.target = target
		child.anim = animation_player
		
		# Conectar señal para transicionar
		child.transitioned.connect(change_state)
		
		# Añadir estado al diccionario
		states[child.name] = child
	
	# Colocar el inicial como el actual
	current_state = inital_state
	
	# Entrar al estado acutal
	current_state.enter({})

# Process del estado sincronizado con el de la StateMachine
func _process(delta):
	if current_state:
		current_state.state_process(delta)

# Physics process del estado sincronizado con el de la StateMachine
func _physics_process(delta):
	if current_state:
		current_state.state_physics_process(delta)

# Input del estado sincronizado con el de la StateMachine
func _input(event):
	if current_state:
		current_state.state_input(event)

# Función para cambiar de estado
func change_state(state : State, new_state_name : String, args : Dictionary):
	
	# Si se llega a pasar otro estado se corta la funcion
	if state != current_state:
		return
	
	# Crear un nuevo estado a pidiendolo desde el diccionario
	var new_state : State = states[new_state_name]
	
	# Si no existe ese estado se corta la función
	if !new_state:
		return
	
	# Se sale del estado actual
	current_state.exit()
	
	# Se coloca el nuevo estado como el actual
	current_state = new_state
	
	# Se entra al nuevo estado
	current_state.enter(args)
