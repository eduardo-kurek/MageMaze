class_name Weapon
extends Resource

@export var pattern: IShot
@export var bullet: BulletDef
#@export var aim: Callable
@export var interval: float

var cooldown: float = 0.0

func tick(delta: float, origin: Vector2, wants_to_fire: bool) -> void:
	cooldown = maxf(0.0, cooldown - delta)
	if not wants_to_fire or cooldown > 0.0:
		return

	cooldown = interval
	var direction: Vector2 = Vector2.DOWN
	pattern.fire(ShotContext.new(origin, direction, bullet))
