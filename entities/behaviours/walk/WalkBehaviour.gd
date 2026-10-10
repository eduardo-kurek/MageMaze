class_name WalkBehaviour
extends IWalk

@export var next: IWalk

func get_velocity(ctx: WalkContext) -> Vector2:
	return next.get_velocity(ctx)
