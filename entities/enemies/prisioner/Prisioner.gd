class_name Prisioner
extends CharacterBody2D

@export var shots_per_second: float = 2.0
@export var walk: IWalk
@export var shot_emitters: Array[ShotEmitter] = []

var _walk_ctx := WalkContext.new()

func _physics_process(delta: float) -> void:
	if walk:
		_walk_ctx.position = global_position
		_walk_ctx.delta = delta
		velocity = walk.get_velocity(_walk_ctx)
		move_and_slide()
	
	for emitter in shot_emitters:
		emitter.tick(delta, global_position, Vector2.DOWN)
