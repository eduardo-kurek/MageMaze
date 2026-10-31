class_name GroupDirection
extends DirectionSource

@export var group: StringName

var target_node: Node2D

func get_direction(actor: Node) -> Vector2:
	var body := actor as Node2D
	if body == null:
		push_error("GroupDirection precisa de um ator Node2D")
		return Vector2.ZERO

	var target := _find_target(body)
	if target == null:
		push_warning("GroupDirection em '%s' não encontrou objetos no grupo informado" % actor.name)
		return Vector2.ZERO

	var to_target := target.global_position - body.global_position
	if to_target.length_squared() < 0.0001:
		return Vector2.ZERO
	return to_target.normalized()
	
func _find_target(body: Node2D) -> Node2D:
	if not is_instance_valid(target_node):
		target_node = body.get_tree().get_first_node_in_group(group) as Node2D
	return target_node
