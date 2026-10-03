class_name Brain
extends Node

@export var walk_behaviour: WalkBehaviour

func _physics_process(delta: float) -> void:
	think(delta)

func think(_delta: float) -> void:
	pass
