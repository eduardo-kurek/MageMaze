class_name Bullet
extends Area2D

var _velocity: Vector2
var _damage: int
var _lifetime: float
var _radius: float
var _color: Color

func setup(ctx: ShotContext) -> void:
	global_position = ctx.position
	_velocity = ctx.direction * ctx.bullet.speed
	_damage = ctx.bullet.damage
	_lifetime = ctx.bullet.lifetime
	_radius = ctx.bullet.radius
	_color = ctx.bullet.color

func _ready() -> void:
	# colisão criada por código (sem precisar de cena)
	var shape := CircleShape2D.new()
	shape.radius = _radius
	var col := CollisionShape2D.new()
	col.shape = shape
	add_child(col)

	body_entered.connect(_on_body_entered)

func _physics_process(delta: float) -> void:
	position += _velocity * delta
	_lifetime -= delta
	if _lifetime <= 0.0:
		queue_free()

func _draw() -> void:
	draw_circle(Vector2.ZERO, _radius, _color)

func _on_body_entered(body: Node) -> void:
	queue_free()
