class_name Checkpoint
extends Node2D

@onready var respawn_point: Marker2D = $RespawnPoint
@onready var area: Area2D = $Area2D

func _ready() -> void:
	area.connect("body_entered", _on_player_entered)

func get_respawn_position() -> Vector2:
	return respawn_point.global_position if respawn_point else global_position

func set_active() -> void:
	pass

func set_inactive() -> void:
	pass

func _on_player_entered(_body: Node2D) -> void:
	CheckpointController.set_checkpoint(self)
