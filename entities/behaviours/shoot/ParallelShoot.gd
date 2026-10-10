class_name ParallelShot
extends ShotBehaviour

@export_range(1, 1, 1, "or_greater") var count: int = 3
@export var spacing: float = 16.0

func process(ctx: ShotContext) -> Array[ShotContext]:
	var shots: Array[ShotContext] = []
	for shot in next.process(ctx):
		var side := shot.direction.orthogonal().normalized()
		var start := -spacing * (count - 1) / 2.0
		for i in count:
			var parallel_shot := shot.copy()
			parallel_shot.position += side * (start + spacing * i)
			shots.append(parallel_shot)
	return shots
