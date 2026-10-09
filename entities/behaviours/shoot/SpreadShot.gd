class_name SpreadShot
extends ShotBehaviour

enum Distribution {
	BETWEEN,
	EVENLY,
}

@export_range(0.0, 360.0, 0.1) var angle_degrees: float = 45.0
@export_range(1, 50, 1) var count: int = 3
@export var distribution: Distribution = Distribution.BETWEEN

func fire(ctx: ShotContext) -> void:
	for offset in _compute_offsets():
		var shot := ctx.copy()
		shot.direction = ctx.direction.rotated(offset)
		next.fire(shot)

func _compute_offsets() -> Array[float]:
	var offsets: Array[float] = []

	if count <= 1:
		offsets.append(0.0)
		return offsets

	var total := deg_to_rad(angle_degrees)

	match distribution:
		Distribution.BETWEEN:
			var step := total / (count - 1)
			var start := -total / 2.0
			for i in count:
				offsets.append(start + step * i)

		Distribution.EVENLY:
			var step := total / count
			var start := -total / 2.0 + step / 2.0
			for i in count:
				offsets.append(start + step * i)

	return offsets
