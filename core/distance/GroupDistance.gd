class_name GroupDistance
extends DistanceSource

@export var group: StringName

var target_node: Node2D

func get_distance_squared(ctx: StateContext) -> float:
	var body := ctx.actor as Node2D
	if body == null:
		push_error("GroupDistance precisa estar em um Node2D")
		return INF

	var target := _find_target(body)
	if target == null:
		push_error("GroupDistance não encontrou alvo")
		return INF

	return body.global_position.distance_squared_to(target.global_position)
	
func _find_target(body: Node2D) -> Node2D:
	if not is_instance_valid(target_node):
		target_node = body.get_tree().get_first_node_in_group(group) as Node2D
	return target_node
