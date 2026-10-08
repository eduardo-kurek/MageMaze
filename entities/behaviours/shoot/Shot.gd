class_name Shot
extends IShot

var _spawner: BulletSpawner

func _init(spawner: BulletSpawner) -> void:
	_spawner = spawner

func fire(ctx: ShotContext) -> void:
	_spawner.spawn(ctx)
