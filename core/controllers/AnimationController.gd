class_name AnimationController
extends Node

@export var animated_sprite: AnimatedSprite2D

var _requests: Dictionary = {}
var _last_facing := Vector2.DOWN

func request_animation(request: AnimationRequest) -> AnimationHandle:
	var handle := AnimationHandle.new()
	_requests[handle] = request
	_refresh()
	return handle

func release_animation(handle: AnimationHandle) -> void:
	if _requests.erase(handle):
		_refresh()
		
func update_animation(handle: AnimationHandle) -> void:
	if _requests.has(handle):
		_refresh()

func _refresh() -> void:
	var best: AnimationRequest = null
	for r: AnimationRequest in _requests.values():
		if best == null or r.priority > best.priority:
			best = r
	if best == null:
		return

	var facing := best.facing
	if facing == Vector2.ZERO:
		facing = _facing_from_requests()
	if facing != Vector2.ZERO:
		_last_facing = facing

	_play(best.anim, _last_facing)

func _facing_from_requests() -> Vector2:
	var found: AnimationRequest = null
	for r: AnimationRequest in _requests.values():
		if r.facing != Vector2.ZERO and (found == null or r.priority > found.priority):
			found = r
	return found.facing if found else Vector2.ZERO

func _play(anim: StringName, facing: Vector2) -> void:
	if animated_sprite == null:
		return
	if absf(facing.x) > 0.01:
		animated_sprite.flip_h = facing.x < 0.0
	if animated_sprite.animation != anim or not animated_sprite.is_playing():
		animated_sprite.play(anim)
