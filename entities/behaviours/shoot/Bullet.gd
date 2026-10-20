class_name Bullet
extends Area2D

var _velocity: Vector2
var _damage: int
var _lifetime: float

func setup(ctx: ShotContext) -> void:
	var def := ctx.bullet
	_velocity = ctx.direction * def.speed
	_damage = def.damage
	_lifetime = def.lifetime
	rotation = ctx.direction.angle()
	scale = Vector2.ONE * def.scale
	collision_layer = ctx.layer
	collision_mask = ctx.mask

	var sprite := Sprite2D.new()
	sprite.texture = def.texture
	sprite.modulate = def.tint
	add_child(sprite)

	var col := CollisionShape2D.new()
	col.shape = def.shape
	add_child(col)

func _ready() -> void:
	area_entered.connect(_on_hit)
	body_entered.connect(_on_hit)

func _physics_process(delta: float) -> void:
	position += _velocity * delta
	_lifetime -= delta
	if _lifetime <= 0.0:
		queue_free()

func _on_hit(_other: Node) -> void:
	queue_free()
