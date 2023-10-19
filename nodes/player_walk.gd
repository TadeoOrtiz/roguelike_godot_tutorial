extends State

var input_component : InputComponent
var velocity_component : VelocityComponent

func enter(args := {}):
	input_component = target.get_node("InputComponent")
	velocity_component = target.get_node("VelocityComponent")
	anim.play("Walk")

func state_process(delta : float) -> void:
	if input_component.input_motion == Vector2.ZERO:
		emit_signal("transitioned", self, "Idle", {})
	
	if input_component.input_motion.x != 0:
		target.get_node("Sprite").scale.x = roundi(input_component.input_motion.x)
	
	velocity_component.move(delta, input_component.input_motion)
	
	
	if input_component.input_attack:
		emit_signal("transitioned", self, "MoveAttack", {
			"direction": input_component.input_motion,
			"velocity_component": velocity_component,
			"force": 10
		})

