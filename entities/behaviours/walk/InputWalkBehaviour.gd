class_name InputWalkBehaviour
extends WalkBehaviour

func walk() -> void:
	if not strategy:
		return

	var direction := Input.get_vector(
		"move_left", "move_right",
		"move_up", "move_down"
	)
	strategy.walk(direction)
