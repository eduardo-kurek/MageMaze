class_name NodeFinder
extends RefCounted

static func find_child_of_type(root: Node, type: Script) -> Node:
	for child in root.get_children():
		if is_instance_of(child, type):
			return child
	return null
