class_name ShotBehaviour
extends IShot

@export var next: IShot

func fire(ctx: ShotContext) -> void:
	next.fire(ctx)
