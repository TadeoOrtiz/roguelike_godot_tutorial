extends State

var health_component : HealthComponent

func enter(args := {}):
	health_component = target.get_node("HealthComponent")
	
	if args.has("direction"):
		args["velocity_component"].move(0, args["direction"] * args["force"])
	
	health_component.damage(5)
	print(health_component.current_health)
	await get_tree().create_timer(0.1).timeout
	emit_signal("transitioned", self, "Idle", {})
