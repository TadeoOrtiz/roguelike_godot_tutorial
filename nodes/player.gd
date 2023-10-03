extends CharacterBody2D


var speed = 100


func _ready():
	pass


func _process(delta):
	
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	
	velocity = direction * speed
	
	move_and_slide()
	
