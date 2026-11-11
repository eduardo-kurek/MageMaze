class_name DeathComponent
extends Node

@export var health: HealthComponent
@export var target: Node2D
@export var entries: Array[LootEntry]

const SCATTER := 8.0

func _ready() -> void:
	if health == null:
		push_error("DeathComponent sem HealthComponent em '%s'" % get_parent().name)
		return
		
	if target == null:
		push_error("DeathComponent sem alvo em '%s'" % get_parent().name)
	health.died.connect(_on_died)
	
func _on_died() -> void:
	if is_instance_valid(target):
		var origin := target.global_position
		for entry in entries:
			if randf() > entry.chance:
				continue
			var offset := Vector2.from_angle(randf() * TAU) * randf() * SCATTER
			SceneSpawner.spawn(entry.scene, origin + offset)
		target.queue_free()
