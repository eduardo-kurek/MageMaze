class_name Player
extends CharacterBody2D

@onready var health : HealthComponent = $HealthComponent

func _ready() -> void:
	health.connect("died", _on_died)
	
func _on_died() -> void:
	get_tree().call_deferred("reload_current_scene")
