class_name DeathComponent
extends Node

@export var health: HealthComponent
@export var target: Node

func _ready() -> void:
	if health == null:
		push_error("DeathComponent sem HealthComponent em '%s'" % get_parent().name)
		return
		
	if target == null:
		push_error("DeathComponent sem algo em '%s'" % get_parent().name)
	health.died.connect(_on_died)
	
func _on_died() -> void:
	if is_instance_valid(target):
		target.queue_free()
