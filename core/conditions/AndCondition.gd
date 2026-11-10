class_name AndCondition
extends StateCondition

@export var conditions: Array[StateCondition] = []

func evaluate(ctx: StateContext) -> bool:
	if conditions.is_empty():
		return false

	for condition in conditions:
		if condition == null:
			continue
		if not condition.evaluate(ctx):
			return false
	return true
