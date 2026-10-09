class_name OffsetShot
extends ShotBehaviour

@export var distance: float = 5.0

func fire(ctx: ShotContext) -> void:
	var shot := ctx.copy()
	shot.position = ctx.position + ctx.direction * distance
	next.fire(shot)
