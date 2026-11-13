class_name ShotBehaviour
extends Resource

@export var next: ShotBehaviour

func process(ctx: ShotContext) -> Array[ShotContext]:
	if next == null:
		return [ctx]
	return next.process(ctx)
