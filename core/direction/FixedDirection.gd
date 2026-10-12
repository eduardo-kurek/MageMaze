class_name FixedDirection
extends DirectionSource

@export var direction := Vector2.DOWN

func get_direction(actor: Node2D) -> Vector2:
	return direction
