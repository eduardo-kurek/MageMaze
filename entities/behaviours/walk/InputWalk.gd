class_name InputWalk
extends IWalk

@export var speed: float = 200.0

func get_velocity(_ctx: WalkContext) -> Vector2:
	return Input.get_vector("move_left", "move_right", "move_up", "move_down") * speed
