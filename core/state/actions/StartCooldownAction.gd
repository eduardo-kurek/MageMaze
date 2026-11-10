class_name StartCooldownAction
extends StateAction

@export var cooldown_id: StringName

func enter(ctx: StateContext) -> void:
	var timer := CooldownTimer.find(ctx.actor, cooldown_id)
	if timer == null:
		push_error("StartCooldownAction sem CooldownTimer '%s' em '%s'" % [cooldown_id, ctx.actor.name])
		return
	timer.start()
