class_name RotatingShot
extends ShotBehaviour

@export_range(-360.0, 360.0, 0.1) var step_degrees: float = 0.0
@export_range(0, 10, 1, "or_greater") var reset_after_shots: int = 0 # Reset the state when this amount of shots is fired

var _angle_degrees: float = 0.0
var _shots_fired: int = 0

func process(ctx: ShotContext) -> Array[ShotContext]:
	var shots := next.process(ctx)
	for shot in shots:
		shot.direction = shot.direction.rotated(deg_to_rad(_angle_degrees))
	_shots_fired += 1

	if reset_after_shots > 0 and _shots_fired >= reset_after_shots:
		reset()
	else:
		_angle_degrees = fposmod(_angle_degrees + step_degrees, 360.0)
	return shots

func reset() -> void:
	_angle_degrees = 0.0
	_shots_fired = 0
