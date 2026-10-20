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

	var sprite := Sprite2D.new()
	sprite.texture = def.texture
	sprite.modulate = def.tint
	add_child(sprite)

	var col := CollisionShape2D.new()
	col.shape = def.shape
	add_child(col)

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	position += _velocity * delta
	_lifetime -= delta
	if _lifetime <= 0.0:
		queue_free()

func _on_body_entered(_body: Node) -> void:
	queue_free()
