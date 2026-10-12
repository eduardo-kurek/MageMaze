class_name VelocityDirection
extends DirectionSource

func get_direction(actor: Node2D) -> Vector2:
	var body := actor as CharacterBody2D
	if body == null:
		push_error("VelocityDirection precisa de um ator CharacterBody2D")
	return body.velocity.normalized()
