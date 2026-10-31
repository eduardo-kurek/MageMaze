class_name InputDirection
extends DirectionSource

func get_direction(_actor: Node, _delta: float) -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down")
