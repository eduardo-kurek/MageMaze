extends Node

signal bullet_requested(ctx: ShotContext)

func request_bullet(ctx: ShotContext) -> void:
	bullet_requested.emit(ctx)
