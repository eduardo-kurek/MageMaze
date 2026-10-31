class_name HealthBar
extends ProgressBar

@export var health: HealthComponent

func _ready() -> void:
	if health == null:
		push_error("HealthBar sem HealthComponent")
		return
	max_value = health.max_health
	value = health.max_health
	health.health_changed.connect(_on_health_changed)

func _on_health_changed(_old: int, current_health: int) -> void:
	value = current_health
