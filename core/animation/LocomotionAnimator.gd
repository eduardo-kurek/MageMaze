class_name LocomotionAnimator
extends Node

@export var idle: AnimationRequest
@export var walk: AnimationRequest

var _walk_handle: AnimationHandle
var _move: MoveController
var _anim: AnimationController

func _ready() -> void:
	var actor := get_parent()
	_move = NodeFinder.find_child_of_type(actor, MoveController) as MoveController
	_anim = NodeFinder.find_child_of_type(actor, AnimationController) as AnimationController
	if _move == null or _anim == null:
		push_error("LocomotionAnimator precisa de MoveController e AnimationController no ator")
		return

	_anim.request_animation(idle)
	_move.moving_changed.connect(_on_moving_changed)

func _on_moving_changed(is_moving: bool) -> void:
	if is_moving:
		_walk_handle = _anim.request_animation(walk)
	else:
		_anim.release_animation(_walk_handle)
		_walk_handle = null
