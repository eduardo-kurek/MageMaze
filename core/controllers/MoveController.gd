class_name MoveController
extends Node

signal moving_changed(is_moving: bool)
signal facing_changed(facing: Vector2)

@export var body: CharacterBody2D

var _requested := Vector2.ZERO
var last_velocity := Vector2.ZERO
var facing := Vector2.DOWN
var is_moving := false

func _ready() -> void:
	if body == null:
		push_error("MoveController precisa de um CharacterBody2D")

func move(velocity: Vector2) -> void:
	_requested += velocity

func _physics_process(_delta: float) -> void:
	body.velocity = _requested
	body.move_and_slide()
	last_velocity = body.velocity
	_requested = Vector2.ZERO
	_update_state()

func _update_state() -> void:
	var moving := last_velocity.length_squared() > 1.0

	if moving:
		var new_facing := last_velocity.normalized()
		if new_facing != facing:
			facing = new_facing
			facing_changed.emit(facing)

	if moving != is_moving:
		is_moving = moving
		moving_changed.emit(is_moving)
