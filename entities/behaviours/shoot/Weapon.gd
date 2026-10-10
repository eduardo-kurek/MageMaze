class_name Weapon
extends Resource

@export var shot_emitters: Array[ShotEmitter] = []

func tick(delta: float, origin: Vector2, wants_to_fire: bool) -> void:
	for e in shot_emitters:
		e.tick(delta, origin, Vector2.DOWN)
