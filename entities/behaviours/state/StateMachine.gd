class_name StateMachine
extends Node

signal state_changed(previous: StringName, current: StringName)

@export var initial_state: StringName
@export var states: Array[StateMachineState] = []

var _runtime_states: Array[StateMachineState] = []
var _states_by_id: Dictionary = {}
var _current: StateMachineState
var _ctx := StateContext.new()

func _ready() -> void:
	_init_context()
	_init_runtime_states()
	_init_states_dictionary()
	
	_validate_runtime_states()
	_change_state(initial_state)

func _init_context() -> void:
	_ctx.actor = get_parent()
	if _ctx.actor == null:
		push_error("StateMachine precisa ter um pai")
	if states.is_empty():
		push_error("StateMachine precisa de pelo menos um estado")

func _init_runtime_states() -> void:
	_runtime_states.assign(states.duplicate_deep(Resource.DEEP_DUPLICATE_ALL)) 

func _init_states_dictionary() -> void:
	_states_by_id.clear()
	for state in _runtime_states:
		if state == null or state.id == &"" or _valid_state(state.id):
			push_error("StateMachine contém estado nulo, sem ID ou com ID repetido")
		_states_by_id[state.id] = state
		for action in state.actions:
			if action == null:
				push_error("Estado '%s' contém ação nula" % state.id)

func _validate_runtime_states() -> void:
	if not _valid_state(initial_state):
		push_error("Estado inicial '%s' não existe" % initial_state)
	
	for state in _runtime_states:
		for transition in state.transitions:
			if transition == null or transition.condition == null:
				push_error("Estado '%s' contém transição sem condição" % state.id)
			
			if not _states_by_id.has(transition.target_state):
				push_error("Estado '%s' aponta para '%s', que não existe" % [state.id, transition.target_state])

func _physics_process(delta: float) -> void:
	_update_context(delta)
	_evaluate_current_transitions();
	_current.update_physics(_ctx)
	
func _update_context(delta: float) -> void:
	_ctx.delta = delta
	_ctx.time_in_state += delta
	
func _evaluate_current_transitions() -> void:
	for transition in _current.transitions:
		if transition.condition.evaluate(_ctx):
			_change_state(transition.target_state)
			break

func _change_state(id: StringName) -> bool:
	if not _valid_state(id):
		push_error("Estado '%s' não existe" % id)
		return false

	if _in_state(id): return true
	
	_do_change_state(id)
	return true
	
func _valid_state(id: StringName) -> bool:
	if not _states_by_id.has(id):
		return false
	return true
	
func _in_state(id: StringName) -> bool:
	if _current != null and _current.id == id:
		return true
	return false

func _do_change_state(id: StringName) -> void:
	var previous: StringName = &""
	if _current != null:
		previous = _current.id
		_current.exit(_ctx)
	_current = _states_by_id[id]
	_ctx.time_in_state = 0.0
	_current.enter(_ctx)
	state_changed.emit(previous, id)

func get_current_state_id() -> StringName:
	return _current.id if _current != null else &""
