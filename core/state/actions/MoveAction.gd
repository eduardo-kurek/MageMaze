class_name MoveAction
extends StateAction

@export var direction: DirectionSource
@export var speed: float = 200.0

func update_physics(ctx: StateContext) -> void:
	var body := ctx.actor as CharacterBody2D
	body.velocity = direction.get_direction(ctx.actor) * speed
	body.move_and_slide()
