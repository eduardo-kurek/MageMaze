class_name PlayerBrain
extends Brain

func think(_delta: float) -> void:
	var dir := Input.get_vector(
		"move_left", "move_right", 
		"move_up", "move_down"
	)
	walk_behaviour.walk(dir)
 
