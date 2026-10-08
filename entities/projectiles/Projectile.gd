class_name Projectile
extends Node2D

@export var direction: Vector2 = Vector2.DOWN
@export var speed: float = 180.0
@export var lifetime: float = 3.0
@export var radius: float = 4.0
@export var color: Color = Color(1.0, 0.35, 0.15)

func _draw() -> void:
	draw_circle(Vector2.ZERO, radius, color)

func _physics_process(delta: float) -> void:
	global_position += direction * speed * delta
	lifetime -= delta
	if lifetime <= 0.0:
		queue_free()
