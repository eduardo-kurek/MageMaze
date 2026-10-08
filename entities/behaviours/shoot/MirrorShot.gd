class_name MirrorShot
extends ShotBehaviour

func fire(ctx: ShotContext) -> void:
	next.fire(ctx)
	
	var back := ctx.copy()
	back.direction = -back.direction
	next.fire(back)
