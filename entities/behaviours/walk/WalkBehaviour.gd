class_name WalkBehaviour
extends Node

@export var speed: float = 200.0

var actor: CharacterBody2D

func _ready() -> void:
	actor = owner as CharacterBody2D

func walk(_direction: Vector2) -> void:
	push_error("%s mush implement walk" % name)
