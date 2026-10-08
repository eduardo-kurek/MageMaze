class_name BulletSpawner
extends Node

var _spawner_container: Node

func _init(spawner_container: Node):
	_spawner_container = spawner_container
	
func spawn(ctx: ShotContext) -> void:
	var bullet := Bullet.new()
	bullet.setup(ctx)
	_spawner_container.add_child(bullet)
