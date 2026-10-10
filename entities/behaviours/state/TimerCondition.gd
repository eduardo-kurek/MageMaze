class_name TimerCondition
extends ICondition

@export var seconds: float = 1.0

func evaluate(ctx: EntityContext) -> bool:
	return ctx.time_in_state >= seconds
