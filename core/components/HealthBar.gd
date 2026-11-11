class_name HealthBar
extends ProgressBar

@export var health: HealthComponent

func _ready() -> void:
	if health == null:
		push_error("HealthBar sem HealthComponent")
		return

	health.health_changed.connect(_on_health_changed)
	health.max_health_changed.connect(_on_max_health_changed)

func _on_health_changed(_old: int, current_health: int) -> void:
	value = current_health

func _on_max_health_changed(_old: int, new: int) -> void:
	max_value = health.max_health
