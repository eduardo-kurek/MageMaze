class_name CooldownCondition
extends StateCondition

@export var cooldown_id: StringName

var _timer: CooldownTimer

func evaluate(ctx: StateContext) -> bool:
	if _timer == null:
		_timer = _find_timer(ctx.actor)
		if _timer == null:
			push_error("CooldownCondition sem CooldownTimer '%s' em '%s'" % [cooldown_id, ctx.actor.name])
			return false
	return _timer.is_stopped()

func _find_timer(actor: Node) -> CooldownTimer:
	for child in actor.get_children():
		if child is CooldownTimer and child.cooldown_id == cooldown_id:
			return child
	return null
