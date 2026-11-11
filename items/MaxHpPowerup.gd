extends Node2D

func _on_player_entered(body: Node2D) -> void:
	var player := body as Player
	player.max_health.increase(15)
	queue_free()
