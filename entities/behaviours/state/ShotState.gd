class_name ShotState
extends Resource

@export var id: StringName
@export var weapons: Array[Weapon] = []
@export var transitions: Array[ShotStateTransition] = []

func enter() -> void:
	pass

func update_physics(ctx: EntityContext) -> void:
	for weapon in weapons:
		weapon.tick(ctx.delta, ctx.position)
