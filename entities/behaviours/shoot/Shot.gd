class_name Shot
extends IShot

func fire(ctx: ShotContext) -> void:
	ctx.spawner.spawn(ctx) # TODO: mudar isso aqui, deixar spawner global
