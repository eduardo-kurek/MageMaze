class_name AnimationController
extends Node

@export var animated_sprite: AnimatedSprite2D

var _requests: Dictionary = {}
var _last_facing := Vector2.DOWN
var _current_request: AnimationRequest

func _process(delta: float) -> void:
	if _current_request != null:
		_update_facing(delta)

func request_animation(request: AnimationRequest) -> AnimationHandle:
	var handle := AnimationHandle.new()
	_requests[handle] = request
	_refresh()
	return handle

func release_animation(handle: AnimationHandle) -> void:
	if _requests.erase(handle):
		_refresh()
		
func _refresh() -> void:
	var best: AnimationRequest = null
	for r: AnimationRequest in _requests.values():
		if best == null or r.priority > best.priority:
			best = r
	_current_request = best
	if best == null:
		return

	_update_facing(0.0)
	_play_current()

func _update_facing(delta: float) -> void:
	var actor := get_parent() as Node2D
	if actor == null:
		return
	var previous_suffix := _facing_suffix(_last_facing)
	var facing := _facing_from_requests(actor, delta)
	if facing != Vector2.ZERO:
		_last_facing = facing
	if animated_sprite != null and absf(_last_facing.x) > 0.01:
		animated_sprite.flip_h = _last_facing.x < 0.0
	if _current_request != null and _current_request.use_facing_suffix \
			and previous_suffix != _facing_suffix(_last_facing):
		_play_current()

func _play_current() -> void:
	if _current_request == null:
		return
	var anim := _current_request.anim
	if _current_request.use_facing_suffix:
		anim = StringName("%s_%s" % [anim, _facing_suffix(_last_facing)])
	_play(anim)

func _facing_from_requests(actor: Node2D, delta: float) -> Vector2:
	var found: AnimationRequest = null
	var facing := Vector2.ZERO
	for r: AnimationRequest in _requests.values():
		if r.facing == null:
			continue
		var direction := r.facing.get_direction(actor, delta)
		if direction != Vector2.ZERO and (found == null or r.priority > found.priority):
			found = r
			facing = direction
	return facing

func _play(anim: StringName) -> void:
	if animated_sprite == null:
		return
	if animated_sprite.animation != anim or not animated_sprite.is_playing():
		animated_sprite.play(anim)
		
func _facing_suffix(facing: Vector2) -> String:
	if absf(facing.x) > absf(facing.y):
		return "right"
	return "down" if facing.y > 0.0 else "up"
