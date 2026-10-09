class_name ParallelShot
extends ShotBehaviour

@export_range(1, 1, 1, "or_greater") var count: int = 3
@export var spacing: float = 16.0

func fire(ctx: ShotContext) -> void:
	var side := ctx.direction.orthogonal().normalized()
	var start := -spacing * (count - 1) / 2.0

	for i in count:
		var shot := ctx.copy()
		shot.position = ctx.position + side * (start + spacing * i)
		next.fire(shot)
