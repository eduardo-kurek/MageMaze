class_name InputDirection
extends DirectionSource

func get_direction(actor: Node) -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")
