class_name OffsetShot
extends ShotBehaviour

@export var distance: float = 5.0

func process(ctx: ShotContext) -> Array[ShotContext]:
	var shots := super.process(ctx)
	for shot in shots:
		shot.position += shot.direction * distance
	return shots
