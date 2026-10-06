class_name WalkStrategy
extends Node

@export var speed: float = 200.0
@export var acceleration: float = 600.0

var actor: CharacterBody2D

func _ready() -> void:
	actor = owner as CharacterBody2D

func walk(direction: Vector2) -> void:
	var delta := get_physics_process_delta_time()
	var target := direction.normalized() * speed
	actor.velocity = actor.velocity.move_toward(target, acceleration * delta)
	actor.move_and_slide()
