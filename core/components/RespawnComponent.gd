class_name RespawnComponent
extends Node

@export var health: HealthComponent

func _ready() -> void:
	health.died.connect(_on_died)

func _on_died() -> void:
	var pos: Variant = CheckpointController.get_respawn_position()
	(get_parent() as Node2D).global_position = pos
	health.revive()
