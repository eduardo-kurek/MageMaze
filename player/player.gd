class_name Player
extends CharacterBody2D

@export var speed: float = 150
@export var acceleration: float = 500
@export var friction: float = 300

func _physics_process(delta: float) -> void:
	_move_into_direction(delta)

func _move_into_direction(delta: float) -> void:
	var input_direction: Vector2 = Input.get_vector(
		"ui_left", "ui_right",
		"ui_up", "ui_down"
	)
	velocity = input_direction * speed
	move_and_slide()
