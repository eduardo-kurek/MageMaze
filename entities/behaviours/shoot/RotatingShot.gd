class_name RotatingShot
extends ShotBehaviour

@export_range(-360.0, 360.0, 0.1) var step_degrees: float = 0.0
@export_range(0, 1000, 1) var reset_after_shots: int = 0

var _angle_degrees: float = 0.0
var _shots_fired: int = 0

func fire(ctx: ShotContext) -> void:
	var shot := ctx.copy()
	shot.direction = ctx.direction.rotated(deg_to_rad(_angle_degrees))
	next.fire(shot)
	_shots_fired += 1

	if reset_after_shots > 0 and _shots_fired >= reset_after_shots:
		reset()
	else:
		_angle_degrees = fposmod(_angle_degrees + step_degrees, 360.0)

func reset() -> void:
	_angle_degrees = 0.0
	_shots_fired = 0
