class_name DashAction
extends StateAction

@export var direction: DirectionSource
@export var speed: float = 600.0
@export var stop_speed_ratio: float = 0.0
@export var duration: float = 0.25

var _move_controller: MoveController
var _dash_direction := Vector2.ZERO
var _elapsed := 0.0

func enter(ctx: StateContext) -> void:
	_move_controller = NodeFinder.find_child_of_type(ctx.actor, MoveController) as MoveController
	if _move_controller == null:
		push_error("DashAction: o ator '%s' não tem um MoveController" % ctx.actor.name)
		return
	_dash_direction = direction.get_direction(ctx.actor, ctx.delta)
	_elapsed = 0.0

func update_physics(ctx: StateContext) -> void:
	if _move_controller == null:
		return
	_elapsed += ctx.delta
	var t := clampf(_elapsed / duration, 0.0, 1.0)
	var current_speed := speed * lerpf(1.0, stop_speed_ratio, t * t)
	_move_controller.move(_dash_direction * current_speed)
