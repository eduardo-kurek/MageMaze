class_name Player
extends CharacterBody2D

@onready var health_component : HealthComponent = $HealthComponent

@export var max_health: IntStat

func _ready() -> void:
	health_component.died.connect(_on_died)
	max_health.stat_changed.connect(_on_max_health_changed)
	max_health.setup()
	
func _on_died() -> void:
	get_tree().call_deferred("reload_current_scene")
	
func _on_max_health_changed(old_value: int, new_value: int) -> void:
	health_component.set_max_health(new_value)
