class_name TimerCondition
extends StateCondition

@export var seconds: float = 1.0

func evaluate(ctx: StateContext) -> bool:
	return ctx.time_in_state >= seconds
