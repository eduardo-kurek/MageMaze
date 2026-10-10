class_name RandomWalk
extends IWalk

@export var speed: float = 10.0
@export var change_interval: float = 1.5

var _direction: Vector2 = Vector2.ZERO
var _timer: float = 0.0

func get_velocity(ctx: WalkContext) -> Vector2:
	_timer -= ctx.delta
	if _timer <= 0.0:
		_timer = change_interval
		_direction = Vector2.from_angle(randf() * TAU)
	return _direction * speed
