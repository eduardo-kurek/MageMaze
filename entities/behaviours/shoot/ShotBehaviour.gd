class_name ShotBehaviour
extends IShot

var _next: IShot

func _init(next: IShot) -> void:
	_next = next

func fire(ctx: ShotContext) -> void:
	_next.fire(ctx)
