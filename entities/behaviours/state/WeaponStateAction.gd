class_name WeaponStateAction
extends StateAction

@export var weapons: Array[Weapon] = []

func update_physics(ctx: StateContext) -> void:
	var actor := ctx.actor as Node2D
	for weapon in weapons:
		weapon.tick(ctx.delta, actor.global_position)
