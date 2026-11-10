class_name CooldownTimer
extends Timer

@export var cooldown_id : StringName

func _ready() -> void:
	one_shot = true

static func find(actor: Node, id: StringName) -> CooldownTimer:
	for child in actor.get_children():
		if child is CooldownTimer and child.cooldown_id == id:
			return child
	return null
