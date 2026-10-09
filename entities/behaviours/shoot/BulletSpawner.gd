class_name BulletSpawner
extends Node2D

func _ready() -> void:
	ShotBus.bullet_requested.connect(_on_bullet_requested)
	
func _on_bullet_requested(ctx: ShotContext) -> void:
	var bullet := Bullet.new()
	bullet.setup(ctx)
	add_child(bullet)
	bullet.global_position = ctx.position

func _exit_tree() -> void:
	if ShotBus.bullet_requested.is_connected(_on_bullet_requested):
		ShotBus.bullet_requested.disconnect(_on_bullet_requested)
