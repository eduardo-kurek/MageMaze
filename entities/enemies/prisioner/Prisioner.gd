class_name Prisioner
extends CharacterBody2D

@export var walk_behaviour: WalkBehaviour

func _physics_process(_delta: float) -> void:
	if walk_behaviour:
		walk_behaviour.walk()
