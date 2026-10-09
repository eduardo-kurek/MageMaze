class_name Shot
extends IShot

func fire(ctx: ShotContext) -> void:
	ShotBus.request_bullet(ctx)
