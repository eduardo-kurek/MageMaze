class_name Entity
extends CharacterBody2D

@export var walk: IWalk
@export var shot_machine: ShotStateMachine

var _walk_ctx := WalkContext.new()
var _ctx := EntityContext.new()

func _ready() -> void:
	shot_machine.start()

func _physics_process(delta: float) -> void:
	if walk:
		_walk_ctx.position = global_position
		_walk_ctx.delta = delta
		velocity = walk.get_velocity(_walk_ctx)
		move_and_slide()
		
	_update_ctx(delta)
	shot_machine.update_physics(_ctx)

func _update_ctx(delta: float) -> void:
	_ctx.position = global_position
	_ctx.delta = delta
