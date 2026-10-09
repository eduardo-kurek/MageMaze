class_name PauseShot
extends ShotBehaviour

@export_range(1, 1, 1, "or_greater") var fire_count: int = 10
@export_range(1, 1, 1, "or_greater") var skip_count: int = 3

var _position: int = 0

func fire(ctx: ShotContext) -> void:
	var cycle := fire_count + skip_count
	if _position < fire_count:
		next.fire(ctx)
	_position = (_position + 1) % cycle
