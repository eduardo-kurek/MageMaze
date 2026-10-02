class_name Brain
extends Node

@export var walk_behaviour: WalkBehaviour

var actor: CharacterBody2D

func _ready() -> void:
	actor = owner as CharacterBody2D

func _physics_process(delta: float) -> void:
	think(delta)

func think(_delta: float) -> void:
	pass
