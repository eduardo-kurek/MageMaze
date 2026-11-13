@tool
extends Node2D

const HITBOX_COLOR := Color(1, 0, 0, 0.35)

@export var bullet_def: BulletDef:
	set(value):
		_disconnect_from_def()
		bullet_def = value
		_connect_to_def()
		queue_redraw()

func _draw() -> void:
	if bullet_def == null:
		return

	_apply_scale()
	_draw_sprite()
	_draw_hitbox()


func _apply_scale() -> void:
	draw_set_transform(Vector2.ZERO, 0.0, Vector2.ONE * bullet_def.scale)


func _draw_sprite() -> void:
	var texture := bullet_def.texture
	if texture == null:
		return

	var top_left := -texture.get_size() / 2.0
	draw_texture(texture, top_left, bullet_def.tint)


func _draw_hitbox() -> void:
	if bullet_def.shape == null:
		return
	bullet_def.shape.draw(get_canvas_item(), HITBOX_COLOR)

func _connect_to_def() -> void:
	if bullet_def:
		bullet_def.changed.connect(queue_redraw)


func _disconnect_from_def() -> void:
	if bullet_def and bullet_def.changed.is_connected(queue_redraw):
		bullet_def.changed.disconnect(queue_redraw)
