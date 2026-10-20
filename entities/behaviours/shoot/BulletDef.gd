@tool
class_name BulletDef
extends Resource

@export var texture: Texture2D:
	set(value):
		texture = value
		emit_changed()

@export var shape: Shape2D:
	set(value):
		if shape and shape.changed.is_connected(emit_changed):
			shape.changed.disconnect(emit_changed)
		shape = value
		if shape:
			shape.changed.connect(emit_changed)
		emit_changed()

@export_range(0.1, 10.0, 0.05, "or_greater") var scale: float = 1.0:
	set(value):
		scale = value
		emit_changed()

@export var tint: Color = Color.WHITE:
	set(value):
		tint = value
		emit_changed()

@export var speed: float = 300.0
@export var damage: int = 10
@export var lifetime: float = 3.0
