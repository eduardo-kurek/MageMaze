class_name ShotEmitter
extends Resource

@export var pattern: ShotBehaviour
@export var bullet: BulletDef
@export_range(1, 1, 1, "or_greater") var fire_rate: float = 10.0 # 10 = 1 shot per second
var _cooldown: float = -1.0

func tick(delta: float, origin: Vector2) -> void:
	_cooldown -= delta
	if _cooldown > 0.0:
		return
	
	_cooldown = 10.0 / fire_rate
	var ctx := ShotContext.new(origin, Vector2.DOWN, bullet)
	for shot in pattern.process(ctx):
		ShotBus.request_bullet(shot)
