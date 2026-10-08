class_name Weapon
extends RefCounted

var _pattern: IShot
var _bullet: BulletDef
var _aim: Callable
var _interval: float
var _cooldown: float = 0.0

func _init(
	pattern: IShot,
	bullet: BulletDef,
	shots_per_second: float,
	aim: Callable,
) -> void:
	_pattern = pattern
	_bullet = bullet
	_interval = 1.0 / shots_per_second
	_aim = aim
	
func tick(delta: float, origin: Vector2, wants_to_fire: bool) -> void:
	_cooldown = maxf(0.0, _cooldown - delta)
	if not wants_to_fire or _cooldown > 0.0:
		return

	_cooldown = _interval
	var direction: Vector2 = _aim.call(origin)
	_pattern.fire(ShotContext.new(origin, direction, _bullet))
