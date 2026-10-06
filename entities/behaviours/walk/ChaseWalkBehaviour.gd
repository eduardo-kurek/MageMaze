class_name ChaseWalkBehaviour
extends WalkBehaviour

var target: CharacterBody2D

func walk() -> void:
	if not strategy:
		return

	if not is_instance_valid(target):
		target = get_tree().get_first_node_in_group("enemy_target") as CharacterBody2D

	var direction := Vector2.ZERO
	if is_instance_valid(target):
		direction = actor.global_position.direction_to(target.global_position)

	strategy.walk(direction)
