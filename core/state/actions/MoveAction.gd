class_name MoveAction
extends StateAction

@export var direction: DirectionSource
@export var speed: float = 200.0

var _move_controller: MoveController

func enter(ctx: StateContext) -> void:
	_move_controller = NodeFinder.find_child_of_type(ctx.actor, MoveController) as MoveController
	if _move_controller == null:
		push_error("MoveAction: o ator '%s' não tem um MoveController" % ctx.actor.name)

func update_physics(ctx: StateContext) -> void:
	var velocity := direction.get_direction(ctx.actor) * speed
	_move_controller.move(velocity)
