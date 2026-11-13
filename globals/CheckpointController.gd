extends Node

var current: Checkpoint

func set_checkpoint(checkpoint: Checkpoint) -> void:
	if current == checkpoint:
		return
	if is_instance_valid(current):
		current.set_inactive()
	current = checkpoint
	current.set_active()

func get_respawn_position() -> Variant:
	if is_instance_valid(current):
		return current.get_respawn_position()
	return null
