class_name MirrorShot
extends ShotBehaviour

func _init(next: IShot) -> void:
	super(next)

func fire(ctx: ShotContext) -> void:
	_next.fire(ctx)
	
	var back := ctx.copy()
	back.direction = -back.direction
	_next.fire(back)
