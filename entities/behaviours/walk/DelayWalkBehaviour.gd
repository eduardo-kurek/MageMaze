class_name DelayWalkBehaviour
extends WalkBehaviour

@export var acceleration: float = 600.0

func walk(direction: Vector2) -> void:
	var delta := get_physics_process_delta_time()
	var target := direction.normalized() * speed
	actor.velocity = actor.velocity.move_toward(target, acceleration * delta)
	actor.move_and_slide()
