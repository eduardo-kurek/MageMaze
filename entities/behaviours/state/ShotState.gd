class_name ShotState
extends Resource

@export var id: StringName
@export var emitters: Array[ShotEmitter] = []
@export var transitions: Array[ShotStateTransition] = []

func enter() -> void:
	pass

func update_physics(ctx: EntityContext) -> void:
	for e in emitters:
		e.tick(ctx.delta, ctx.position)
