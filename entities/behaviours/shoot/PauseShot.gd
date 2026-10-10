class_name PauseShot
extends ShotBehaviour

@export_range(1, 1, 1, "or_greater") var fire_count: int = 10
@export_range(1, 1, 1, "or_greater") var skip_count: int = 3

var _position: int = 0

func process(ctx: ShotContext) -> Array[ShotContext]:
	var cycle := fire_count + skip_count
	var shots: Array[ShotContext] = []
	if _position < fire_count:
		shots = next.process(ctx)
	_position = (_position + 1) % cycle
	return shots
