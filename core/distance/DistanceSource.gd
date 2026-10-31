class_name DistanceSource
extends Resource

func get_distance_squared(_ctx: StateContext) -> float:
	push_error("DistanceSource.get_distance_squared() não implementado")
	return INF

func get_distance(ctx: StateContext) -> float:
	return sqrt(get_distance_squared(ctx))
