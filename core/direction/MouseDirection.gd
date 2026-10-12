class_name MouseDirection
extends DirectionSource

func get_direction(actor: Node) -> Vector2:
	var body := actor as Node2D
	if body == null:
		push_error("MouseDirection precisa de um ator Node2D")
		return Vector2.DOWN

	var to_mouse := body.get_global_mouse_position() - body.global_position
	if to_mouse.length_squared() < 0.0001:
		return Vector2.DOWN
	return to_mouse.normalized()
