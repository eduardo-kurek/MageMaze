class_name EnemyBrain
extends Brain

var player: CharacterBody2D

func _ready() -> void:
	player = get_tree().get_first_node_in_group("enemy_target") as CharacterBody2D
