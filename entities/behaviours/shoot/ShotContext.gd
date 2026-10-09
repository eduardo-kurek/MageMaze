class_name ShotContext
extends RefCounted

var position: Vector2
var direction: Vector2
var bullet: BulletDef

func _init(
	p_position := Vector2.ZERO,
	p_direction := Vector2.ZERO,
	p_bullet: BulletDef = null,
) -> void:
	position = p_position
	direction = p_direction
	bullet = p_bullet

func copy() -> ShotContext:
	return ShotContext.new(position, direction, bullet)
