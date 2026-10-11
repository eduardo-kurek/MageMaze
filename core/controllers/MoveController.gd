class_name MoveController
extends Node

@export var body: CharacterBody2D

var _requested := Vector2.ZERO

func _ready() -> void:
	if body == null:
		push_error("MoveController precisa de um CharacterBody2D")

func move(velocity: Vector2) -> void:
	_requested += velocity

func _physics_process(_delta: float) -> void:
	body.velocity = _requested
	body.move_and_slide()
	_requested = Vector2.ZERO
