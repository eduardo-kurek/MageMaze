class_name ShotContext
extends RefCounted

var position: Vector2
var direction: Vector2
var bullet: BulletDef
var layer: int
var mask: int

func _init(
	p_position: Vector2,
	p_direction: Vector2,
	p_bullet: BulletDef,
	p_layer: int,
	p_mask: int,
) -> void:
	position = p_position
	direction = p_direction
	bullet = p_bullet
	layer = p_layer
	mask = p_mask

func copy() -> ShotContext:
	return ShotContext.new(position, direction, bullet, layer, mask)
