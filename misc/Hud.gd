class_name Hud
extends CanvasLayer

@onready var _health_bar := $Control/LeftPanel/MarginContainer/VBoxContainer/HealthBar
@onready var _health_label := $Control/LeftPanel/MarginContainer/VBoxContainer/HealthBar/HealthLabel

@export var player: Player

func _ready() -> void:
	player.health_component.health_changed.connect(_on_player_health_changed)
	player.health_component.max_health_changed.connect(_on_player_max_health_changed)
	pass

func _on_player_health_changed(_old: int, new: int) -> void:
	_health_bar.value = new
	_update_health_label()
	pass

func _on_player_max_health_changed(_old: int, new: int) -> void:
	_health_bar.max_value = new
	_update_health_label()
	pass

func _update_health_label() -> void:
	var current = player.health_component.current_health
	var max = player.health_component.max_health
	_health_label.text = "%d / %d" % [current, max]
	pass
