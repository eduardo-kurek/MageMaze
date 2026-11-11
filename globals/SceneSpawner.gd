extends Node

func spawn(scene: PackedScene, origin: Vector2):
	var node = scene.instantiate();
	if node is Node2D:
		node.global_position = origin
	get_tree().current_scene.add_child(node)
	return node
