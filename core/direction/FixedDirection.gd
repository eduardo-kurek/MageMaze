class_name FixedDirection
extends DirectionSource

@export var direction := Vector2.DOWN

func get_direction(_actor: Node2D, _delta: float) -> Vector2:
	return direction
