class_name StateMachine
extends Node

signal state_changed(previous: StringName, current: StringName)

@export var states: Array[State] = []

var _core: StateMachineCore

func _ready() -> void:
	var runtime_states: Array[State] = []
	runtime_states.assign(states.duplicate_deep(Resource.DEEP_DUPLICATE_ALL))

	_core = StateMachineCore.new(runtime_states)
	_core.state_changed.connect(state_changed.emit)

	_core.start(get_parent())

func _physics_process(delta: float) -> void:
	_core.update(delta)

func _exit_tree() -> void:
	if _core:
		_core.stop()

func get_current_state_id() -> StringName:
	return _core.get_current_state_id()
