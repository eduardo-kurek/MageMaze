class_name ShotEmitter
extends Resource

@export var pattern: ShotBehaviour
@export var bullet: BulletDef
@export_range(1, 1, 1, "or_greater") var fire_rate: float # 10 = 1 shot per second
@export var initial_delay: float
var _cooldown: float = -1.0

func tick(delta: float, origin: Vector2, direction: Vector2) -> void:
	if _cooldown < 0.0:
		_cooldown = initial_delay
	_cooldown -= delta
	if _cooldown > 0.0:
		return
	
	_cooldown = 10.0 / fire_rate
	var ctx := ShotContext.new(origin, direction, bullet)
	for shot in pattern.process(ctx):
		ShotBus.request_bullet(shot)
