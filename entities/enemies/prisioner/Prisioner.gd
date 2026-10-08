class_name Prisioner
extends CharacterBody2D

@export var target: Node2D
@export var shots_per_second: float = 2.0
@export var walk_behaviour: WalkBehaviour

var _weapon: Weapon

func _ready() -> void:
	var spawner := BulletSpawner.new(get_parent())
	var pattern: IShot = MirrorShot.new(Shot.new(spawner))
	var bullet := BulletDef.new()
	
	_weapon = Weapon.new(pattern, bullet, shots_per_second, _get_aim)

func _physics_process(delta: float) -> void:
	if walk_behaviour:
		walk_behaviour.walk()
	
	_weapon.tick(delta, global_position, true)

func _get_aim(origin: Vector2) -> Vector2:
	if target:
		return origin.direction_to(target.global_position)
	return Vector2.DOWN
