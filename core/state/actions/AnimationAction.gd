class_name AnimationAction
extends StateAction

@export var anim_request: AnimationRequest

var _controller: AnimationController
var _anim_handle: AnimationHandle

func enter(ctx: StateContext) -> void:
	_controller = NodeFinder.find_child_of_type(ctx.actor, AnimationController) as AnimationController
	if _controller == null:
		push_error("AnimationAction: o ator '%s' não tem um AnimationController" % ctx.actor.name)
		return
	_anim_handle = _controller.request_animation(anim_request)

func exit(_ctx: StateContext) -> void:
	if _controller:
		_controller.release_animation(_anim_handle)
		_controller = null
