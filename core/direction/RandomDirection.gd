class_name RandomDirection
extends DirectionSource

@export_range(0.1, 10.0, 0.1, "or_greater") var change_interval := 0.2
@export_range(0.0, 1.0, 0.05) var idle_chance := 0.0

var _direction := Vector2.ZERO
var _timer := 0.0

func get_direction(_actor: Node2D, delta: float) -> Vector2:
	_timer -= delta
	if _timer <= 0.0:
		_timer = change_interval
		_direction = _pick_direction()
	return _direction

func _pick_direction() -> Vector2:
	if randf() < idle_chance:
		return Vector2.ZERO
	return Vector2.from_angle(randf() * TAU)
