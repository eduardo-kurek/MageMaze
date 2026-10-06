class_name WalkBehaviour
extends Node

@export var strategy: WalkStrategy

var actor: CharacterBody2D

func _ready() -> void:
	actor = owner as CharacterBody2D

func walk() -> void:
	push_error("%s must implement walk" % name)
