class_name LinearWalkBehaviour
extends WalkBehaviour

func walk(direction: Vector2) -> void:
	actor.velocity = direction.normalized() * speed
	actor.move_and_slide()
