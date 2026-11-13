extends Node

func spawn(scene: PackedScene, origin: Vector2):
	var node := scene.instantiate();
	if node is Node2D:
		node.global_position = origin
	call_deferred('_attach_node', node)
	return node
	
func _attach_node(node: Node):
	get_tree().current_scene.add_child(node)
