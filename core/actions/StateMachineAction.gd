class_name StateMachineAction
extends StateAction

@export var states: Array[State] = []

var _core: StateMachineCore

func enter(ctx: StateContext) -> void:
	_core = StateMachineCore.new(states)
	_core.start(ctx.actor)

func update_physics(ctx: StateContext) -> void:
	if _core:
		_core.update(ctx.delta)

func exit(_ctx: StateContext) -> void:
	if _core:
		_core.stop()
		_core = null
