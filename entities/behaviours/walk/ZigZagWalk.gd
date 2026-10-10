class_name ZigzagWalk
extends WalkBehaviour

@export var amplitude: float = 40.0
@export var frequency: float = 1.0

var _time: float = 0.0

func get_velocity(ctx: WalkContext) -> Vector2:
	var v := next.get_velocity(ctx)
	if v == Vector2.ZERO:
		return v

	_time += ctx.delta
	var side := v.orthogonal().normalized()
	return v + side * sin(_time * TAU * frequency) * amplitude
