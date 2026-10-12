class_name InputCondition
extends StateCondition

enum InputMethod {
	JUST_PRESSED,
	PRESSED,
	JUST_RELEASED
}

@export var action: StringName
@export var input_method := InputMethod.PRESSED

func evaluate(_ctx: StateContext) -> bool:
	match input_method:
		InputMethod.JUST_PRESSED:
			return Input.is_action_just_pressed(action)
		InputMethod.PRESSED:
			return Input.is_action_pressed(action)
		InputMethod.JUST_RELEASED:
			return Input.is_action_just_released(action)
	return false
