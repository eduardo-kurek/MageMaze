class_name ChaseWalk
extends IWalk

@export var speed: float = 60.0
@export var stop_distance: float = 0.0

func get_velocity(ctx: WalkContext) -> Vector2:
	if ctx.target == null:
		return Vector2.ZERO
	var to_target := ctx.target.global_position - ctx.position
	if to_target.length() <= stop_distance:
		return Vector2.ZERO
	return to_target.normalized() * speed
