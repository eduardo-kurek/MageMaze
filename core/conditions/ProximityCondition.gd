class_name ProximityCondition
extends StateCondition

enum Mode { WITHIN, BEYOND }

@export var source: DistanceSource
@export var threshold: float = 100.0
@export var mode: Mode = Mode.WITHIN

func evaluate(ctx: StateContext) -> bool:
	if source == null:
		push_error("ProximityCondition sem DistanceSource")
		return false

	var distance := source.get_distance(ctx)
	match mode:
		Mode.WITHIN: return distance <= threshold
		Mode.BEYOND: return distance > threshold
	return false
