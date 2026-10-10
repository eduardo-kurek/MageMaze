class_name ShotBehaviour
extends IShot

@export var next: IShot

func process(ctx: ShotContext) -> Array[ShotContext]:
	return next.process(ctx)
