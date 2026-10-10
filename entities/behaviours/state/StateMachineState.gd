class_name StateMachineState
extends Resource

@export var id: StringName
@export var actions: Array[StateAction] = []
@export var transitions: Array[StateMachineTransition] = []

func enter(ctx: StateContext) -> void:
	for action in actions:
		action.enter(ctx)

func update_physics(ctx: StateContext) -> void:
	for action in actions:
		action.update_physics(ctx)

func exit(ctx: StateContext) -> void:
	for action in actions:
		action.exit(ctx)
