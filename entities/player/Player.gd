class_name Player
extends CharacterBody2D

@export var walk: IWalk

var _walk_ctx := WalkContext.new()

func _physics_process(delta: float) -> void:
	if walk:
		_walk_ctx.position = global_position
		_walk_ctx.delta = delta
		velocity = walk.get_velocity(_walk_ctx)
		move_and_slide()
